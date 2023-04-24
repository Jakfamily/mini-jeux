require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# création des joueurs
player1 = Player.new("josiane", 10)
player2 = Player.new("josé", 10)

round = 0

# affichage de l'état initial de chaque joueur
puts "la partie vas commencer, voici l'etat de chaque joueur :"
puts
puts player1.show_state
puts player2.show_state

# boucle de jeu tant que les deux joueurs sont en vie
while player1.life_points > 0 && player2.life_points > 0
  round += 1
  puts
  puts "*******************Round #{round}**********************"
  puts
  puts "fight !"
  puts

  # le joueur 1 attaque le joueur 2 s'il est en vie
  if player1.life_points > 0
    puts player1.attacks(player2)
    puts player2.show_state
  end

  # le joueur 2 attaque le joueur 1 s'il est en vie
  if player2.life_points > 0
    puts player2.attacks(player1)
    puts player1.show_state
  end
end

# affichage du résultat de la partie
if player1.life_points <= 0
  puts "#{player1.name} est KO GAME OVER !"
elsif player2.life_points <= 0
  puts "#{player2.name} est KO GAME OVER !"
end

