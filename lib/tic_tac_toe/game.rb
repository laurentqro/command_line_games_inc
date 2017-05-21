class Game
  attr_reader :board, :player_1, :player_2, :current_player

  def initialize(board: Board.new, session:)
    @board = board
    @player_1 = session.player_1
    @player_2 = session.player_2
    @current_player = session.first_player
  end

  def is_over?
    board.win? || board.tie?
  end

  def next_player
    current_player == player_1 ? @current_player = player_2 : @current_player = player_1
  end
end
