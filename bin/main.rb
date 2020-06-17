#!/usr/bin/env ruby

require './lib/helper.rb'
require './lib/player.rb'
require './lib/board.rb'

name = Helper.read_string(
  'Hello player 1 please enter your name: ',
  'Your name can\'t be empty. Please enter a name: '
) { |str| !str.empty? }

shape1 = Helper.read_string(
  "#{name} please pick your shape no longer than 5 characters: ",
  'Please enter a string no longer than 5 characters: '
) { |str| !str.empty? && str.size < 6 }

player1 = Player.new(name, shape1)

name = Helper.read_string(
  'Hello player 2 please enter your name: ',
  'Your name can\'t be empty. Please enter a name: '
) { |str| !str.empty? }

shape2 = Helper.read_string(
  "#{name} please pick your shape no longer than 5 characters and different from player 1's shape: ",
  'Please enter a string no longer than 5 characters and different from player 1\'s shape: '
) { |str| !str.empty? && str.size < 6 && str != shape1 }

player2 = Player.new(name, shape2)

print 'Please enter the size of the board: '
size = Helper.read_integer(10)

board = Board.new(player1, player2, size)

Helper.clear_console
loop do
  # clear the board
  Helper.render_board(board.board, board.size)
  print "Make your move #{board.current_player.name} (#{board.current_player.sym}): "

  loop do
    move = Helper.read_integer(board.size * board.size)
    if board.field_empty?(move - 1)
      board.update_field(move - 1)
      break
    end
    print 'This field is already populated. Please select another one: '
  end
  Helper.clear_console

  winner = board.check_winner
  if winner.nil? # If it's nil then it's a tie
    puts 'It\'s a tie'
  elsif winner # Otherwise
    puts "Congrats #{winner.name}. You have won"
  end
  if winner.nil? || winner
    print "\n"
    Helper.render_board(board.board, board.size)
    print "Enter 'y' if you want to start a new game or any other key to exit: "
    command = gets.chomp
    break unless command.downcase == 'y'

    board = Board.new(player1, player2, size)
    next
  end
  board.switch_player
end
