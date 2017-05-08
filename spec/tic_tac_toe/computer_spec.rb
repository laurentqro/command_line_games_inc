require "tic_tac_toe/computer"
require "tic_tac_toe/game"

describe Computer do
  describe "#get_spot" do
    it "plays 4 if position is available" do
      computer = Computer.new(mark: "X")
      opponent = Computer.new(mark: "O")
      game = Game.new

      spot = computer.get_spot(game.board, opponent: opponent)

      expect(spot).to eql "4"
    end

    it "plays for the win" do
      computer = Computer.new(mark: "X")
      opponent = Computer.new(mark: "O")
      grid = ["X", "X", "2",
              "O", "O", "5",
              "6", "7", "8"]
      board = Board.new(grid: grid)
      game = Game.new(board: board)

      spot = computer.get_spot(game.board, opponent: opponent)

      expect(spot).to eql "2"
    end

    it "blocks opponent from winning on his next move" do
      computer = Computer.new(mark: "X")
      opponent = Computer.new(mark: "O")
      grid = ["X", "O", "X",
              "O", "O", "5",
              "6", "7", "8"]
      board = Board.new(grid: grid)
      game = Game.new(board: board)

      spot = computer.get_spot(game.board, opponent: opponent)

      expect(spot).to eql "5"
    end
  end
end
