require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "--------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO'!        |"
puts "|Le but du jeu est d'etre le dernier survivant ! |"
puts "|Pret pour le combat a mort !                    |"
puts "--------------------------------------------------"
puts
# initialisation du joueur : 
puts "entrez votre prénom :"
name = gets.chomp
player = HumanPlayer.new(name)
puts "intialisation du jouer en cours"
puts # ajout dune barre a cree ?

# initialisation enemies
player1 = Player.new("josianne",10)
player2 = Player.new("josé",10)

# initialisation d'un groupe d'enemie ## reste a definir un tableau avec x enemies
enemies = []
enemies << player1
enemies << player2

round = 0
puts " Que le combat jusqu'a la mort commence :"
puts
puts player.show_state
while player.life_points > 0 && player1.life_points > 0 || player2.life_points > 0
round += 1
puts 
puts "*******************Round #{round}**********************"
puts "fight !"
puts "Quelle action veut effetuer"
puts #liste d'action a cree chercher une mellieur arme /chercher du soin/ attaquer player 1 || player 2


binding.pry