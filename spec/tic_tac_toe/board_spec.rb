require "tic_tac_toe/board"

describe Board do
  describe "#new" do
    it "has a grid" do
      expect(Board.new.grid).to eql ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
  end

  describe "#win?" do
    it "identifies win" do
      grid = ["X", "X", "X", "3", "4", "5", "6", "7", "8"]
      board = Board.new(grid: grid)

      expect(board.win?).to eq true
    end
  end

  describe "#tie?" do
    it "identifies tie" do
      grid = ["O", "X", "O", "X", "O", "X", "O", "X", "O"]
      board = Board.new(grid: grid)

      expect(board.tie?).to eql true
    end
  end

  describe "#mark" do
    it "marks spot with mark" do
      board = Board.new
      board.mark("1", "X")

      expect(board.grid).to eql ["X", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
  end

  describe "#winner" do
    it "returns the winning mark" do
      grid = ["X", "X", "X", 4, "O", 6 , "O", 8, 9]
      board = Board.new(grid: grid)

      expect(board.winner).to eql "X"
    end
  end
end
