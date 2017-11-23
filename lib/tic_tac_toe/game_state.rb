class GameState
  attr_reader :board, :current_player_mark, :max_player_mark

  def initialize(board:, current_player_mark:, max_player_mark:)
    @board = board
    @current_player_mark = current_player_mark
    @max_player_mark = max_player_mark
  end

  def score
    return 0 if board.tie?
    return 1 if board.winner == max_player_mark
    return -1
  end

  def terminal?
    board.win? || board.tie?
  end
end
