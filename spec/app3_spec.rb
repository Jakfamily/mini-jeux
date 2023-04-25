require_relative '../lib/human_player'
require_relative '../lib/game.rb'

describe HumanPlayer do
  context "when initialized with a name and life points" do
    let(:player) { HumanPlayer.new("John", 100) }

    it "has life points" do
      expect(player.life_points).to eq(100) # Vérifie si le joueur a bien 100 points de vie
    end
  end
end 