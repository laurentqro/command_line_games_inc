class Computer
  attr_reader :mark, :name

  def initialize(mark: "X", name: "Dumbot")
    @mark = mark
    @name = name
  end

  def get_spot(board)
    return "4" if board.grid[4] == "4"

    board.available_spaces.each do |as|
      board.mark(as, mark)
      # if can win with next move, play that
      if board.win? || board.tie?
        best_move = as
        board.mark(as, as, is_reset: true)
        return best_move
      else
        # block human winning with next move
        board.mark(as, as, is_reset: true)
        board.mark(as, opponent_mark)
        if board.win? || board.tie?
          best_move = as
          board.mark(as, as, is_reset: true)
          return best_move
        else
          board.mark(as, as, is_reset: true)
        end
      end
    end

    n = rand(0..board.available_spaces.count)
    return board.available_spaces[n]
  end

  def is_human?
    false
  end

  def opponent_mark
    mark == "X" ? "O" : "X"
  end
end
