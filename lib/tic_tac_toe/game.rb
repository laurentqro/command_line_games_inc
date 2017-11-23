class Game
  attr_reader :board, :player_1, :player_2, :current_player

  def initialize(board: Board.new, session:)
    @board = board
    @player_1 = session.player_1
    @player_2 = session.player_2
  end

  def is_over?
    board.win? || board.tie?
  end

  def current_player
    board.current_player
  end
end
