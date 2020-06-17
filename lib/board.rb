class Board
  attr_reader :current_player
  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2  
  @board = Array.new(9, nil)
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

end