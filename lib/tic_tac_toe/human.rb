class Human
  attr_accessor :mark
  attr_reader :number

  def initialize(number: nil, mark: nil)
    @number = number
    @mark = mark
  end

  def choose_mark(opponent:)
    if opponent.mark.nil?
      gets.chomp
    else
      opponent.mark == "X" ? "O" : "X"
    end
  end

  def get_spot(_board)
    gets.chomp
  end

  def to_s
    "Player #{number}"
  end
end
