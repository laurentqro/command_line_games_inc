require 'tic_tac_toe/cli/display'
require 'tic_tac_toe/board'
require 'tic_tac_toe/human'
require 'tic_tac_toe/cli/session'

describe Cli::Display do
  describe "#print_board" do
    it "prints the board" do
      board = Board.new
      expected_message =  " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8\n"
      expect { described_class.new.print_board(board.grid) }.to output(expected_message).to_stdout
    end
  end

  describe "#pick_player" do
    it "prompts user to pick player type (human or computer)" do
      expected_message = "Player 1 Human (1) or CPU (2)?\n"
      expect { described_class.new.pick_player(1) }.to output(expected_message).to_stdout
    end
  end

  describe "#announce_setup" do
    it "gives user a recap of the game setup" do
      player_1 = Human.new(number: 1, mark: "X")
      player_2 = Human.new(number: 2, mark: "O")
      session = Cli::Session.new(player_1: player_1, player_2: player_2, first_player: player_1)

      expected_message = "Player 1 plays with X.\nPlayer 2 plays with O.\nPlayer 1 will play first.\n"
      expect { described_class.new.announce_setup(session) }.to output(expected_message).to_stdout
    end
  end

  describe "#pick_first_player" do
    it "prompts user to choose which player will play first" do
      expected_message = "Who will play first?\n1. Player 1\n2. Player 2\n"
      expect { described_class.new.pick_first_player }.to output(expected_message).to_stdout
    end
  end

  describe "#announce_move" do
    it "announces the current player's move" do
      player = Human.new(number: 1, mark: "X")
      expect { described_class.new.announce_move(player, 0) }.to output( "Player 1 played X on spot 0.\n").to_stdout
    end
  end

  describe "#pick_move" do
    it "prompts the user to pick a spot on the board" do
      expect { described_class.new.pick_move }.to output("Enter [0-8]:\n").to_stdout
    end
  end

  describe "#announce_win" do
    it "announces the winner of the game" do
      winner = Human.new(number: 1)
      expect { described_class.new.announce_win(winner) }.to output("Player 1 wins!\n").to_stdout
    end
  end

  describe "#announce_draw" do
    it "announces the draw" do
      expect { described_class.new.announce_draw }.to output("Draw!\n").to_stdout
    end
  end

  describe "#announce_player_turn" do
    it "informs the user of the current player" do
      player = Human.new(number: 1)
      expect { described_class.new.announce_player_turn(player) }.to output("Player 1's turn to play.\n").to_stdout
    end
  end
end
