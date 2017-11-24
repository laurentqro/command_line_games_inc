require 'tic_tac_toe/game_state'

class Computer
  attr_reader :mark

  def initialize(mark: nil)
    @mark = mark
  end

  def pick_move(board)
    minimax(game_state: GameState.new(board: board, current_player_mark: mark, max_player_mark: mark))
  end

  private

  def minimax(game_state:, depth: 0, spot_scores: {})
    return game_state.score if game_state.terminal?

    next_player_mark = (game_state.current_player_mark == "X" ? "O" : "X")

    game_state.board.available_spots.each do |spot|
      new_board = Board.new(grid: game_state.board.grid.dup)
      next_board = new_board.mark(spot, game_state.current_player_mark)
      next_game_state = GameState.new(board: next_board, current_player_mark: next_player_mark, max_player_mark: mark)
      spot_scores[spot] = minimax(game_state: next_game_state, depth: depth +=1, spot_scores: {})
    end

    if depth == game_state.board.available_spots.length
      return spot_scores.max_by { |spot, score| score }[0]
    end

    if game_state.current_player_mark == mark
      return spot_scores.max_by { |spot, score| score }[1]
    end

    if game_state.current_player_mark == opponent_mark
      return spot_scores.min_by { |spot, score| score }[1]
    end
  end

  def opponent_mark
    mark == "X" ? "O" : "X"
  end
end
