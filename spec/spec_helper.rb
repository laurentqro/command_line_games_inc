require 'simplecov'
require 'pry'

SimpleCov.start

class TestPlayer
  attr_reader :mark, :moves

  def initialize(mark:, moves: [])
    @mark = mark
    @moves = moves
  end

  def pick_move(board)
    moves.shift
  end
end

class TestDisplay
  attr_reader :inputs

  def initialize(inputs: [])
    @inputs = inputs
  end

  def get_input
    inputs.shift
  end

  def clear_screen
  end

  def print_board(grid)
  end

  def announce_player_turn(player)
  end

  def pick_move
  end

  def invalid_move(spot)
  end

  def announce_draw
  end

  def goodbye
  end

  def play_again
  end
end
