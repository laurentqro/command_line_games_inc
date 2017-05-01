class InvalidInputError < StandardError
  def initialize(input)
    @input = input
  end

  def message
    "#{@input} is not a valid move."
  end
end
