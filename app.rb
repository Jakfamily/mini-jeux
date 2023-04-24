require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("josiane",10)
player2 = Player.new("josé",10)

round = 0

puts "la partie commence , voici l'etat de chaque joueur :"
puts
puts player1.show_state
puts player2.show_state
while player1.life_points > 0 && player2.life_points > 0
  round +=1
  puts
  puts"*******************Round #{round}**********************"
  puts "fight !"
  puts
  puts player1.attacks(player2)
  puts player2.show_state
  puts player2.attacks(player1)
  puts player1.show_state
end

if player1.life_points <= 0
  puts "#{player1.name} est KO GAME OVER !"
elsif player2.life_points <= 0
  puts "#{player2.name} est KO GAME OVER !"
end


binding.pry

