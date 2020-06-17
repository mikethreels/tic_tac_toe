module Helper
  def self.shape
    shape = gets.chomp
    while shape.size > 5 || shape.empty?
      print
      shape = gets.chomp
    end
    shape
  end

  def self.render_board(board, size)
    board.each_with_index do |field, index|
      print '|' unless (index % size).zero?
      if field.nil?
        print((index + 1).to_s.center(12))
      else
        print field.center(12)
      end

      next unless ((index + 1) % size).zero?

      print "\n"
      print '-' * (12 * size + (size - 1)) unless index == (size * size - 1)
      print "\n"
    end
  end

  def self.read_integer(max)
    loop do
      move = gets.chomp
      begin
        move = Integer(move)
        return move if move.positive? && move <= max

        print "Please enter a number between 1 and #{max}: "
      rescue ArgumentError
        print "Please enter a number between 1 and #{max}: "
      end
    end
  end

  def self.clear_console
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end

  def self.read_string(message, error_message)
    print message
    string = gets.chomp
    until yield string
      print error_message
      string = gets.chomp
    end
    string
  end
end
