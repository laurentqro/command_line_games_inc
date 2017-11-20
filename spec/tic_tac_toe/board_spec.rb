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

    it "raises an error if move is illegal" do
      grid = ["X", "1", "2", "3", "4", "5", "6", "7", "8"]
      board = Board.new(grid: grid)

      expect { board.mark("0", "X") }.to raise_error(IllegalMoveError)
    end

    it "raises an error if user input is invalid" do
      expect { Board.new.mark("gibberish", "O") }.to raise_error(InvalidInputError)
    end
  end

  describe "#winner_is?" do
    it "returns true if the mark is the winner" do
      grid = ["X", "X", "X", 4, "O", 6 , "O", 8, 9]
      board = Board.new(grid: grid)

      expect(board.winner_is?("X")).to eql true
    end
  end
end
