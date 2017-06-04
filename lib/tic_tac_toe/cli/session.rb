module Cli
  class Session
    attr_accessor :player_1, :player_2, :first_player

    def initialize(player_1: nil, player_2: nil, first_player: nil)
      @player_1 = player_1
      @player_2 = player_2
      @first_player = first_player
    end

    def setup
      set_player_1
      set_player_2
      set_marks
      set_first_player
      self
    end

    def set_player_1
      display.pick_player(1)
      choice = display.get_input
      @player_1 = choice == "1" ? Human.new(number: 1) : Computer.new(number: 1)
    end

    def set_player_2
      display.pick_player(2)
      choice = display.get_input
      @player_2 = choice == "1" ? Human.new(number: 2) : Computer.new(number: 2)
    end

    def set_marks
      display.pick_mark_for(@player_1) if @player_1.is_a?(Human)
      choice = display.get_input
      @player_1.mark = choice == "1" ? "X" : "O"
      @player_2.mark = player_1.mark == "X" ? "O" : "X"
    end

    def set_first_player
      display.pick_first_player
      choice = display.get_input
      @first_player = choice == "1" ? @player_1 : @player_2
    end

    def display
      Display.new
    end
  end
end
