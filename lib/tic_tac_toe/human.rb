class Human
  attr_accessor :mark
  attr_reader :name

  def initialize(mark: nil, name: "Hooman")
    @name = name
    @mark = mark
  end

  def choose_mark(opponent: nil)
    if opponent.mark.nil?
      gets.chomp
    else
      opponent.mark == "X" ? "O" : "X"
    end
  end

  def get_spot(_board)
    gets.chomp
  end
end
