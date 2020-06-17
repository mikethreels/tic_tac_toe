class Board
  attr_reader :current_player
  attr_reader :board
  attr_reader :size
  def initialize(player1, player2, size = 3)
    @player1 = player1
    @player2 = player2
    @size = size
    @board = Array.new((@size * @size), nil)
    @current_player = player1
  end

  def switch_player
    @current_player = @current_player.sym == @player1.sym ? @player2 : @player1
  end

  def field_empty?(arg)
    @board[arg].nil?
  end

  def update_field(arg)
    @board[arg] = @current_player.sym
  end

  def check_winner
    return @current_player unless check_hori == false
    return @current_player unless check_vert == false
    return @current_player unless check_diag == false
    return nil if @board.none?(&:nil?)

    false
  end

  private

  def check_hori
    @size.times.each do |i|
      return true if !@board[i].nil? && (0..(@size - 1)).all? { |x| @board[i * @size + x] == @board[i] }
    end
    false
  end

  def check_vert
    @size.times.each do |i|
      return true if !@board[i].nil? && (0..(@size - 1)).all? { |x| @board[x * @size + i] == @board[i] }
    end
    false
  end

  def check_diag
    return true if !@board[0].nil? && (0..(@size - 1)).all? { |x| @board[x * @size + x] == @board[0] }
    return true if !@board[@size - 1].nil? && (0..(@size - 1)).all? do |x|
      @board[x * @size + (@size - x - 1)] == @board[@size - 1]
    end

    false
  end
end
