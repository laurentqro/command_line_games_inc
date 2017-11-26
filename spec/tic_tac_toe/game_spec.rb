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
end
