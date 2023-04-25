require 'bundler'
Bundler.require

# Require des classes
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

# Affichage du message d'accueil
puts "--------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO'!        |"
puts "|Le but du jeu est d'etre le dernier survivant ! |"
puts "|Pret pour le combat a mort !                    |"
puts "--------------------------------------------------"
puts
puts "Initialisation du joueur ...."
# Initialisation du joueur
puts "Entrez votre prénom :"
user_name = gets.chomp
puts
puts "Initialisation de la partie ...."
game = Game.new(user_name) # Initialise le joueur avec 100 points de vie et ces enemies
puts 
game.show_players # Affiche les informations du joueur (nom et points de vie)

puts " Que le combat jusqu'a la mort commence :"
puts

# Boucle principale du jeu
while game.is_still_ongoing?
  game.menu
  choice = gets.chomp.to_i
  game.menu_choice(choice)
  game.enemies_attack
  game.show_players
  game.new_players_in_sight
end

# Affichage du résultat de la partie
game.end_game
