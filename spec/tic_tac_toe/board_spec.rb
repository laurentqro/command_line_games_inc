require "tic_tac_toe/board"

describe Board do
  describe "#new" do
    it "has a grid" do
      expect(Board.new.grid).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end
  end

  describe "#print_grid" do
    it "prints the board" do
      expected_output =  " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"

      expect { Board.new.print_grid }.to output(expected_output).to_stdout
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
      board.mark("0", "X")

      expect(board.grid).to eql ["X", "1", "2", "3", "4", "5", "6", "7", "8"]
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
end
