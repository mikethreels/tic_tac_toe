#!/usr/bin/env ruby

player1 = { shape: :X }
player2 = { shape: :O }
current_player = player1
winner = nil

puts 'hello player 1 please enter your name'
player1[:name] = gets.chomp

puts 'hello player 2 please enter your name'
player2[:name] = gets.chomp

board = []
loop do
  puts "make your move #{current_player[:name]}"
  loop do
    move = gets.chomp
    begin
      index = Integer(move)
      if index < 1 || index > 9
        puts 'Please enter a number between 1 and 9'
        next
      elsif board[index - 1] != ''
        puts 'This field is already populated. Please select another one'
      else
        puts "Update the board field with the index #{index - 1} with the shape for the current player"
        break
      end
    rescue ArgumentError
      puts 'Please enter a number between 1 and 9'
    end
  end
  # Check if a player has already won and update with winner variable and break out of the loop
  # Check if the board is full and break out of the loop (TIE)
  current_player = current_player[:shape] == player1[:shape] ? player2 : player1
end

# Check the winner variable to determine which user has won
if winner.nil? # If it's nil then it's a tie
  puts 'It\'s a tie'
else # Otherwise
  puts "Congrats #{winner}. You have won"
end
