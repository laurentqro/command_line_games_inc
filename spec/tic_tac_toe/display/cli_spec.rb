require 'tic_tac_toe/display/cli'

describe Display::Cli do
  describe "#print_grid" do
    it "prints the board" do
      grid = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      expected_output =  " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"

      expect { Display::Cli.new.print(grid) }.to output(expected_output).to_stdout
    end
  end
end

