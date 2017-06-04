class Human
  attr_accessor :mark
  attr_reader :number

  def initialize(number: nil, mark: nil)
    @number = number
    @mark = mark
  end

  def to_s
    "Player #{number}"
  end
end
