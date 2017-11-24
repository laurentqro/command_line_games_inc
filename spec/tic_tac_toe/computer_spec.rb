require "tic_tac_toe/computer"
require "tic_tac_toe/board"

describe Computer do
  describe "#pick_move" do
    it "plays for the win" do
      computer = Computer.new(mark: "X")
      grid = ["X", "X", "3",
              "O", "O", "6",
              "7", "8", "9"]
      board = Board.new(grid: grid)

      move = computer.pick_move(board)

      expect(move).to eql "3"
    end

    it "blocks opponent from winning on his next move" do
      computer = Computer.new(mark: "O")
      grid = ["X", "O", "X",
              "4", "O", "6",
              "O", "X", "X"]
      board = Board.new(grid: grid)
      move = computer.pick_move(board)

      expect(move).to eql "6"
    end
  end
end
