class InvalidInputError < StandardError
  def initialize(input)
    @input = input
  end

  def message
    "#{@input} is not valid input."
  end
end
