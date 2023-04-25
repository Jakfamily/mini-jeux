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

# Initialisation du joueur
puts "Entrez votre prénom :"
user_name = gets.chomp
player = HumanPlayer.new(user_name, 100) # Initialise le joueur avec 100 points de vie
puts "Initialisation du joueur en cours ...."
puts 
puts player.show_state # Affiche les informations du joueur (nom et points de vie)

# Initialisation des ennemisles
player1 = Player.new("josianne",10)
player2 = Player.new("josé",10)

# Création d'un tableau qui contient tous les ennemis
enemies = []
enemies << player1
enemies << player2

# Initialisation du compteur de rounds
round = 0

puts " Que le combat jusqu'a la mort commence :"
puts

# Boucle principale du jeu
while player.life_points > 0 && !enemies.empty? # Tant que le joueur est en vie et qu'il reste des ennemis
  # Vérifie si tous les ennemis sont morts, et sort de la boucle si c'est le cas
  break if enemies.all? { |enemy| enemy.life_points <= 0 }

  round += 1
  puts 
  puts "*******************Round #{round}**********************"
  puts
  puts "Fight !"
  puts
  puts "Quelle action veut tu effetuer ?"
  puts "1 - Chercher une meilleure arme"
  puts "2 - Chercher à se soigner"
  puts "3 - Attaquer #{player1.name}" if player1.life_points > 0
  puts "4 - Attaquer #{player2.name}" if player2.life_points > 0

  choice = gets.chomp.to_i
  
  case choice
  when 1
    player.search_weapon # Le joueur cherche une arme

  when 2
    player.search_health_pack # Le joueur cherche à se soigner

  when 3
    if player1.life_points > 0 # Si l'ennemi est en vie
      player.attacks(player1) # Le joueur attaque l'ennemi
      puts
      puts player1.show_state # Affiche les informations de l'ennemi

    elsif player1.life_points <= 0 # Si l'ennemi est mort
        puts "#{player1.name} est dead !"
        enemies.delete(player1) # Retire l'ennemi du tableau des ennemis

    else # Si l'ennemi n'existe plus
       puts "#{player1.name} est déjà mort !"
    end

  when 4
    if player2.life_points > 0 # Si l'ennemi est en vie
      player.attacks(player2) # Le joueur attaque l'ennemi
      puts
      puts player2.show_state # Affiche les informations de l'ennemi
    elsif player2.life_points <= 0 # Si l'ennemi est mort
      puts "#{player2.name} est dead !"
      enemies.delete(player2) # Retire l'ennemi du tableau des ennemis
    else # Si l'ennemi n'existe plus
      puts "#{player2.name} est déjà mort !"
    end

  else # sinon le choix n'est pas valide
    puts "Tu n'as pas choisi d'action valide."    
  end

  # Les deux ennemis attaquent simultanément le joueur
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(player)
      puts
      puts player.show_state
    end
  end

  # Vérification si le joueur est toujours en vie
  if player.life_points <= 0
    puts "Tu as perdu ! GAME OVER"
    break # Sort de la boucle si le joueur est mort
  end
end

# affichage du résultat de la partie
if player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end

binding.pry