class Human
  attr_reader :mark, :display

  def initialize(mark: nil, display: Cli::Display.new)
    @mark = mark
    @display = display
  end

  def pick_move(board)
    display.get_input
  end
end
