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
      player_x: TestPlayer.new(mark: "X", moves: ["1", "2", "3"]),
      player_o: TestPlayer.new(mark: "O", moves: ["4", "5"]),
      display: display
    )
    game = Game.new(config: config)

    expect(display).to receive(:announce_win)

    game.start
  end

  it "notifies players of draw" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["1", "3", "5", "6", "8"]),
      player_o: TestPlayer.new(mark: "O", moves: ["2", "4", "7", "9"]),
      display: display
    )

    game = Game.new(config: config)

    expect(display).to receive(:announce_draw)

    game.start
  end

  it "notifies player of invalid move until a valid move is picked" do
    config = Config.new(
      player_x: TestPlayer.new(mark: "X", moves: ["foo", "bar", "1"]),
      player_o: TestPlayer.new(mark: "O"),
      display: display
    )

    game = Game.new(config: config)

    expect(display).to receive(:invalid_move)

    game.play_single_turn
  end

  it "resets the game with a pristine board" do
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

    game.reset

    expect(game.board.grid).to eql(Board.new.grid)
  end
end
