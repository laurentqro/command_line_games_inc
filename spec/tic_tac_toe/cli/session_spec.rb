require 'tic_tac_toe/cli/session'
require 'tic_tac_toe/human'
require 'tic_tac_toe/computer'

describe Cli::Session do
  describe "#setup" do
    it "returns a configured session" do
      display = Cli::Display.new
      session = described_class.new(display: display)
      allow(display).to receive(:get_input).and_return("1", "2", "1", "1")

      configured_session = session.setup

      expect(session.player_1).to be_a(Human)
      expect(session.player_1.number).to eql 1

      expect(session.player_2).to be_a(Computer)
      expect(session.player_2.number).to eql 2

      expect(session.player_1.mark).to eql "X"
      expect(session.player_2.mark).to eql "O"

      expect(session.first_player).to be(session.player_1)
      expect(configured_session).to be_a(Cli::Session)
    end
  end
end

