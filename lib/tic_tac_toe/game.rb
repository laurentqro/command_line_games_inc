class Game
  attr_reader :board
  attr_accessor :player_1, :player_2, :current_player

  def initialize(board: Board.new, player_1: nil, player_2: nil, current_player: nil)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = current_player
  end

  def is_over?
    board.win? || board.tie?
  end

  def next_player
    current_player == player_1 ? @current_player = player_2 : @current_player = player_1
  end
end
