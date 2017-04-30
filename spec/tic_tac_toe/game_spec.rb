require "tic_tac_toe/game"

describe Game do
  describe "#print_board" do
    it "prints the board" do
      expected_output =  " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"

      expect { Game.new.print_board }.to output(expected_output).to_stdout
    end
  end

  describe "#prompt_player_input" do
    it "tells the player when the game is over" do
      expect { Game.new.prompt_player_input }.to output("Enter [0-8]:\n").to_stdout
    end
  end

  describe "#notify_game_over" do
    it "tells the player when the game is over" do
      expect { Game.new.notify_game_over }.to output("Game over\n").to_stdout
    end
  end

  describe "#get_human_spot" do
    it "gets human player's play" do
      game = Game.new
      allow(game).to receive(:get_input) { 8 }
      game.get_human_spot

      expect(game.board).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "O"]
    end
  end

  describe "#get_computer_spot" do
    it "plays 4 if position is available" do
      game = Game.new
      game.get_computer_spot

      expect(game.board).to eql ["0", "1", "2", "3", "X", "5", "6", "7", "8"]
    end

    it "plays its best move if position 4 is not available" do
      board = ["0", "1", "2", "3", "O", "5", "6", "7", "8"]
      game = Game.new(board: board)
      allow(game).to receive(:get_best_move).with(board).and_return(1)

      game.get_computer_spot

      expect(game.board).to eql ["0", "X", "2", "3", "O", "5", "6", "7", "8"]
    end
  end

  describe "#get_best_move" do
    it "plays for the win" do
      board = ["X", "X", "2", "O", "O", "5", "6", "7", "8"]
      game = Game.new(board: board)

      expect(game.get_best_move(board)).to eql 2
    end

    it "blocks opponent from winning on his next move" do
      board = ["X", "O", "X", "O", "O", "5", "6", "7", "8"]
      game = Game.new(board: board)

      expect(game.get_best_move(board)).to eql 5
    end
  end
end
