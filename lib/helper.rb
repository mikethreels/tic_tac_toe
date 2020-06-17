module Helper
  def self.shape
    shape = gets.chomp
    while shape.size > 5 || shape.empty?
      print 'please enter a string no longer than 5 characters'
      shape = gets.chomp
    end
    shape
  end

  def self.render_board(board)
    board.board.each_with_index do |field, index|
      print '|' unless (index % board.size).zero?
      if field.nil?
        print((index + 1).to_s.center(12))
      else
        print field.center(12)
      end

      next unless ((index + 1) % board.size).zero?

      print "\n"
      print '-' * (12 * board.size + (board.size - 1)) unless index == (board.size * board.size - 1)
      print "\n"
    end
  end

  def self.read_move(size)
    loop do
      move = gets.chomp
      board_size = size * size 
      begin
        move = Integer(move)
        return move if move.positive? && move <= board_size

        print "Please enter a number between 1 and #{board_size}: "
      rescue ArgumentError
        print "Please enter a number between 1 and #{board_size}: "
      end
    end
  end
end
