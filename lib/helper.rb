module Helper
  def self.render_board(board, size)
    layout = ''
    board.each_with_index do |field, index|
      layout << '|' unless (index % size).zero?
      layout << if field.nil?
                  (index + 1).to_s.center(12)
                else
                  field.center(12)
                end

      next unless ((index + 1) % size).zero?

      layout << "\n"
      layout << '-' * (12 * size + (size - 1)) unless index == (size * size - 1)
      layout << "\n"
    end
    layout
  end

  def self.read_integer(max)
    loop do
      move = gets.chomp.strip
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
    string = gets.chomp.strip
    until yield string
      print error_message
      string = gets.chomp.strip
    end
    string
  end
end
