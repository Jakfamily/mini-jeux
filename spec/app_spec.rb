require_relative '../lib/player'


describe Player do
  describe "initialize" do
    it "creates a new player with a name and life points" do
      player = Player.new("josiane", 10) # Crée un nouveau joueur avec un nom et 10 points de vie
      expect(player.name).to eq("josiane") # Vérifie si le nom du joueur est bien "josiane"
      expect(player.life_points).to eq(10) # Vérifie si le joueur a bien 10 points de vie
    end
  end 
end 


