class Config
  attr_accessor :player_x, :player_o

  def initialize(display:)
    @display = display
    @player_x = player_x
    @player_o = player_o
  end

  def run
    display_title
    pick_player_x
    pick_player_o
    self
  end

  private

  attr_reader :display

  def display_title
    display.title
  end

  def pick_player_x
    display.pick_player_for_mark("X")
    choice = display.get_input
    self.player_x = choice == "1" ? Human.new(mark: "X") : Computer.new(mark: "X")
  end

  def pick_player_o
    display.pick_player_for_mark("O")
    choice = display.get_input
    self.player_o = choice == "1" ? Human.new(mark: "O") : Computer.new(mark: "O")
  end
end
