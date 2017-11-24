require 'tic_tac_toe/cli/display'
require 'tic_tac_toe/board'
require 'tic_tac_toe/human'

describe Cli::Display do
  describe "#print_board" do
    it "prints the board" do
      board = Board.new
      expected_message =  " 1 | 2 | 3 \n===+===+===\n 4 | 5 | 6 \n===+===+===\n 7 | 8 | 9\n"
      expect { described_class.new.print_board(board.grid) }.to output(expected_message).to_stdout
    end
  end

  describe "#pick_player_for_mark" do
    it "prompts user to pick player type (human or computer)" do
      expected_message = "Choose player X: Human (1) or Computer (2)?\n"
      expect { described_class.new.pick_player_for_mark("X") }.to output(expected_message).to_stdout
    end
  end

  describe "#pick_move" do
    it "prompts the user to pick a spot on the board" do
      expect { described_class.new.pick_move }.to output("Enter [1-9]:\n").to_stdout
    end
  end

  describe "#invalid_move" do
    it "warns the player of his invalid move" do
      expected_message = "1 is an invalid move. Please enter a spot between 1-9 that is available on the board\n"
      expect { described_class.new.invalid_move("1") }.to output(expected_message).to_stdout
    end
  end

  describe "#announce_win" do
    it "announces the winner of the game" do
      expect { described_class.new.announce_win("X") }.to output("X wins!\n").to_stdout
    end
  end

  describe "#announce_draw" do
    it "announces the draw" do
      expect { described_class.new.announce_draw }.to output("Draw!\n").to_stdout
    end
  end

  describe "#announce_player_turn" do
    it "informs the user of the current player" do
      expect { described_class.new.announce_player_turn("X") }.to output("X's turn to play.\n").to_stdout
    end
  end

  describe "#title" do
    it "displays the game's title" do
      expected = "##################################################\nTIC TAC TOE by Command Line Games Inc.\n##################################################\n"
      expect { described_class.new.title }.to output(expected).to_stdout
    end
  end

  describe "#play_again" do
    it "prompts the user to play again or exit" do
      expect { described_class.new.play_again }.to output("Play again? Yes (1) or No (2)\n").to_stdout
    end
  end

  describe "#goodbye" do
    it "says goodbye" do
      expect { described_class.new.goodbye }.to output("Goodbye!\n").to_stdout
    end
  end
end
