require "tic_tac_toe/game"
require "tic_tac_toe/computer"
require "tic_tac_toe/board"
require "tic_tac_toe/config"
require "tic_tac_toe/cli/display"

describe Game do
  let(:display)  { double("display").as_null_object }

  it "is over when there is a winner" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X"),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )

    grid = ["X", "X", "X",
            "3", "4", "5",
            "6", "7", "8"]
    board = Board.new(grid: grid)
    game = Game.new(board: board, config: config)

    expect(game).to be_over
  end

  it "is over when there is a tie" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X"),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )
    grid = ["O", "X", "O",
            "X", "O", "X",
            "O", "X", "O"]
    board = Board.new(grid: grid)
    game = Game.new(board: board, config: config)

    expect(game).to be_over
  end

  it "announces player turns" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1"]),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )
    game = Game.new(config: config)

    expect(display).to receive(:announce_player_turn)

    game.play_single_turn
  end

  it "prompts player to pick move" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1"]),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )
    game = Game.new(config: config)

    expect(display).to receive(:pick_move)

    game.play_single_turn
  end

  it "changes current player" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2"]),
      display: display
    )
    game = Game.new(config: config)

    2.times do
      game.play_single_turn
    end

    expect(game.board.grid.grep("X").count).to eql 1
    expect(game.board.grid.grep("O").count).to eql 1
  end

  it "notifies players of win" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["3"]),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )
    grid = ["X", "X", "3",
            "O", "O", "5",
            "6", "7", "8"]
    board = Board.new(grid: grid)
    game = Game.new(board: board, config: config)

    expect(display).to receive(:announce_win)

    game.start
  end
end
