#!/usr/bin/env ruby

require './lib/helper.rb'
require './lib/player.rb'
require './lib/board.rb'

print 'Hello player 1 please enter your name: '
name = gets.chomp
print "#{name} please pick your string no longer than 5 characters: "
shape = Helper.shape
player1 = Player.new(name, shape)

print 'Hello player 2 please enter your name: '
name = gets.chomp
print "#{name} please pick your string no longer than 5 characters: "
shape = Helper.shape
player2 = Player.new(name, shape)

board = Board.new(player1, player2)

loop do
  # clear the board
  Gem.win_platform? ? (system 'cls') : (system 'clear')
  Helper.render_board board.board
  print "Make your move #{board.current_player.name} (#{board.current_player.sym}): "

  loop do
    move = Helper.read_move
    if board.field_empty?(move - 1)
      board.update_field(move - 1)
      break
    end
    print 'This field is already populated. Please select another one: '
  end
  # Check if a player has already won and update with winner variable and break out of the loop
  # Check if the board is full and break out of the loop (TIE)
  board.switch_player
end

# Check the winner variable to determine which user has won
if winner.nil? # If it's nil then it's a tie
  puts 'It\'s a tie'
else # Otherwise
  puts "Congrats #{winner}. You have won"
end
