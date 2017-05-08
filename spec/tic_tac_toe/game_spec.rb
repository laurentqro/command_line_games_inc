require "tic_tac_toe/game"

describe Game do
  describe "#start" do
  end

  describe "#next_player" do
    it "sets the game's current player to the other player" do
      player_1 = Human.new
      player_2 = Computer.new
      game = Game.new(player_1: player_1, player_2: player_2, current_player: player_1)
      game.next_player

      expect(game.current_player).to be player_2
    end
  end
end
