#!/usr/bin/env ruby
require './lib/helper.rb'
require './lib/player.rb'
require './lib/board.rb'
# current_player = player1
# winner = nil

print 'hello player 1 please enter your name'
name = gets.chomp
print "#{name} please pick your string no longer than 5 characters"
shape = Helper::get_shape
p player1 = Player.new(name, shape)

print 'hello player 2 please enter your name'
name = gets.chomp
print "#{name} please pick your string no longer than 5 characters"
shape = Helper::get_shape
p player2 = Player.new(name, shape)

board = Board.new(player1, player2)
loop do
  puts "make your move #{board.current_player.name}"
  loop do
    move = gets.chomp
    begin
      index = Integer(move)
      if index < 1 || index > 9
        puts 'Please enter a number between 1 and 9'
        next
      elsif !board.field_empty?(index - 1)
        puts 'This field is already populated. Please select another one'
      else
        board.update_field(index - 1)
        break
      end
    rescue ArgumentError
      puts 'Please enter a number between 1 and 9'
    end
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
