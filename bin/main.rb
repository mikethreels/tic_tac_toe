#!/usr/bin/env ruby

player1 = {shape: :X}
player2 = {shape: :O}
turn = :X

puts 'hello player 1 please enter your name'
player1[:name] = gets.chomp

puts 'hello player 1 please enter your name'
player1[:name] = gets.chomp

board = ['', '', '', '', '', '', '', '', '']
loop do 
  
  if turn == :X
    puts "make your move player 1" 
    gets.chomp
    puts "your move is displayed on the board"
  else
    puts "make you move player 2"
    gets.chomp
    puts "your move is displayed on the board"
  end
  turn = turn == :X ? :O : :X
end


