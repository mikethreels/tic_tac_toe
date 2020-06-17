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
    board.each_with_index do |field, index|
      print '|' unless (index % 3).zero?
      if field.nil?
        print((index + 1).to_s.center(12))
      else
        print field.center(12)
      end

      next unless ((index + 1) % 3).zero?

      print "\n"
      print '-' * (12 * 3) unless index == 8
      print "\n"
    end
  end

  def self.read_move
    loop do
      move = gets.chomp
      begin
        move = Integer(move)
        return move if move.positive? && move < 10

        print 'Please enter a number between 1 and 9: '
      rescue ArgumentError
        print 'Please enter a number between 1 and 9: '
      end
    end
  end
end
