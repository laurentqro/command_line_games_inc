require 'tic_tac_toe/session'

describe Session do
  it "starts a new game" do
    display = TestDisplay.new(inputs: ["2"])
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1", "3", "5", "6", "8"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2", "4", "7", "9"]),
      display:  display
    )
    game = Game.new(config: config)

    expect(game).to receive(:start)

    Session.new(game, display).start
  end

  it "resets the game" do
    display = TestDisplay.new(inputs: ["2"])
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1", "3", "5", "6", "8"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2", "4", "7", "9"]),
      display:  display
    )
    game = Game.new(config: config)

    expect(game).to receive(:reset)

    Session.new(game, display).start
  end

  it "invites user to play again" do
    display = TestDisplay.new(inputs: ["2"])
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1", "3", "5", "6", "8"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2", "4", "7", "9"]),
      display: display
    )
    game = Game.new(config: config)

    expect(display).to receive(:play_again)

    Session.new(game, display).start
  end

  it "says goodbye when the user chooses to exit" do
    display = TestDisplay.new(inputs: ["2"])
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1", "3", "5", "6", "8"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2", "4", "7", "9"]),
      display: display
    )
    game = Game.new(config: config)

    expect(display).to receive(:goodbye)

    Session.new(game, display).start
  end
end
