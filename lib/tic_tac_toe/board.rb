require 'tic_tac_toe/errors/illegal_move_error'

class Board
  attr_accessor :grid

  def initialize(grid: ["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @grid = grid
  end

  def print_grid
    puts " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end

  def available_spaces
    grid.select { |space| space != "X" && space != "O" }
  end

  def win?
    [grid[0], grid[1], grid[2]].uniq.length == 1 ||
    [grid[3], grid[4], grid[5]].uniq.length == 1 ||
    [grid[6], grid[7], grid[8]].uniq.length == 1 ||
    [grid[0], grid[3], grid[6]].uniq.length == 1 ||
    [grid[1], grid[4], grid[7]].uniq.length == 1 ||
    [grid[2], grid[5], grid[8]].uniq.length == 1 ||
    [grid[0], grid[4], grid[8]].uniq.length == 1 ||
    [grid[2], grid[4], grid[6]].uniq.length == 1
  end

  def tie?
    grid.all? { |s| s == "X" || s == "O" }
  end

  def mark(spot, mark, is_reset: false)
    if is_reset || available_spaces.include?(spot.to_s)
      grid[spot] = mark
    else
      raise IllegalMoveError.new(spot)
    end
  end
end
