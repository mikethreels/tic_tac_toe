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

  def self.clear_console
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end
end
