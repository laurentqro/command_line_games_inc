class Human
  attr_reader :mark

  def initialize(mark: "O")
    @mark = mark
  end

  def get_spot(board, opponent:)
    gets.chomp
  end

  def is_human?
    true
  end
end
