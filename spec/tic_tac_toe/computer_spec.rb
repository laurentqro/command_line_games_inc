require "tic_tac_toe/computer"
require "tic_tac_toe/cli/game"

describe Computer do
  describe "#get_spot" do
    it "plays for the win" do
      computer = Computer.new(mark: "X")
      grid = ["X", "X", "3",
              "O", "O", "6",
              "7", "8", "9"]
      board = Board.new(grid: grid)

      spot = computer.get_spot(board)

      expect(spot).to eql "3"
    end

    it "blocks opponent from winning on his next move" do
      computer = Computer.new(mark: "X")
      grid = ["X", "O", "X",
              "O", "O", "6",
              "7", "8", "9"]
      board = Board.new(grid: grid)
      spot = computer.get_spot(board)

      expect(spot).to eql "6"
    end
  end

  describe "#to_s" do
    it "outputs player name" do
      expect(Computer.new(number: 1).to_s).to eq "Player 1"
    end
  end
end
