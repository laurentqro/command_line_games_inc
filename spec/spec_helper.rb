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
