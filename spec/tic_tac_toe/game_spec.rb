require "tic_tac_toe/game"

describe Game do
  describe "#get_human_spot" do
    it "gets human player's play" do
      game = Game.new
      allow(game).to receive(:get_input).and_return("8")
      game.get_human_spot

      expect(game.board.grid).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "O"]
    end
  end

  describe "#get_computer_spot" do
    it "plays 4 if position is available" do
      game = Game.new
      game.get_computer_spot

      expect(game.board.grid).to eql ["0", "1", "2", "3", "X", "5", "6", "7", "8"]
    end

    it "plays its best move if position 4 is not available" do
      grid = ["0", "1", "2", "3", "O", "5", "6", "7", "8"]
      board = Board.new(grid: grid)
      game = Game.new(board: board)
      allow(game).to receive(:get_best_move).and_return("1")

      game.get_computer_spot

      expect(game.board.grid).to eql ["0", "X", "2", "3", "O", "5", "6", "7", "8"]
    end
  end

  describe "#get_best_move" do
    it "plays for the win" do
      grid = ["X", "X", "2", "O", "O", "5", "6", "7", "8"]
      board = Board.new(grid: grid)
      game = Game.new(board: board)

      expect(game.get_best_move).to eql "2"
    end

    it "blocks opponent from winning on his next move" do
      grid = ["X", "O", "X", "O", "O", "5", "6", "7", "8"]
      board = Board.new(grid: grid)
      game = Game.new(board: board)

      expect(game.get_best_move).to eql "5"
    end
  end
end
