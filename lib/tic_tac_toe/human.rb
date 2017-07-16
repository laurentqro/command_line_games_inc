class Human
  attr_accessor :mark
  attr_reader :number

  def initialize(number: nil, mark: nil)
    @number = number
    @mark = mark
  end

  def play(board)
    spot = nil

    until spot
      spot = display.get_input

      begin
        board.mark(spot, mark)
      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        spot = nil
      end
    end

    spot
  end

  def prompt_play
    display.pick_move
  end

  def to_s
    "Player #{number}"
  end

  private

  def display
    Cli::Display.new
  end
end
