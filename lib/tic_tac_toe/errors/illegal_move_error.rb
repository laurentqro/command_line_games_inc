class IllegalMoveError < StandardError
  def initialize(spot)
    @spot = spot
  end

  def message
    "#{@spot} is an illegal move. Please choose an available spot."
  end
end
