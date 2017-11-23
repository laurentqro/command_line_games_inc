require 'tic_tac_toe/errors/illegal_move_error'
require 'tic_tac_toe/errors/invalid_input_error'

class Board
  attr_accessor :grid

  def initialize(grid: ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    @grid = grid
  end

  def available_spots
    grid.select { |spot| spot != "X" && spot != "O" }
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
    if is_reset || available_spots.include?(spot)
      grid[spot.to_i - 1] = mark
    elsif invalid?(spot)
      raise InvalidInputError.new(spot)
    elsif !available_spots.include?(spot)
      raise IllegalMoveError.new(spot)
    end
  end

  def winner
    ["X", "O"].find do |mark|
      winning_combos.any? do |combo|
        combo.all? { |spot| spot == mark }
      end
    end
  end

  private

  def winning_combos
    rows + columns + diagonals
  end

  def rows
    grid.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [] << right_diagonal << left_diagonal
  end

  def right_diagonal
    rows.each_with_index.map { |row, index| row[index] }
  end

  def left_diagonal
    rows.reverse.each_with_index.map { |row, index| row[index] }.reverse
  end

  def invalid?(input)
    input.length > 1 || input.to_i > 8
  end
end
