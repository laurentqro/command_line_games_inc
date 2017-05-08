class Human
  attr_reader :mark, :name

  def initialize(mark: "O", name: "Hooman")
    @name = name
    @mark = mark
  end

  def get_spot(_board)
    gets.chomp
  end

  def is_human?
    true
  end
end
