class Session
  def initialize(game, display)
    @game = game
    @display = display
    @end_session = false
  end

  def start
    until @end_session
      game.start
      end_session?
      game.reset
    end
    display.goodbye
  end

  private

  attr_reader :game, :display

  def end_session?
    display.play_again
    @end_session = player_ends_session?
  end

  def player_ends_session?
    display.get_input == "2"
  end
end
