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
    end
  end
end
