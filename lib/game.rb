# On importe les classes Player et HumanPlayer depuis des fichiers externes
require_relative 'player'
require_relative 'human_player'

# On définit la classe Game
class Game 
  # On définit les variables d'instance human_player et enemies_in_sight
  attr_accessor :human_player, :enemies_in_sight, :players_left, :round

  # On définit le constructeur de la classe Game qui prend un nom de joueur humain en argument
  def initialize(human_player_name)
    # On initialise human_player avec un objet HumanPlayer avec le nom donné et 100 points de vie 
    @human_player = HumanPlayer.new(human_player_name, 100)
    # On initialise players_left avec 10 (nombre d'ennemis restant à éliminer pour gagner)
    @players_left = 10
    # On initialise enemies_in_sight avec un array vide qui va contenir les ennemis en vue
    @enemies_in_sight = []
    # On initialise le jeu avec 4 ennemis en vue
    4.times do
      new_player = Player.new("joueur#{rand(1..20)}", rand(1..20))
      # On ajoute les ennemis en vue à l'array enemies_in_sight
      @enemies_in_sight << new_player
      # On affiche un message pour informer le joueur humain
      puts "Un nouveau joueur adverse arrive en vue : #{new_player.name} (#{new_player.life_points} points de vie)"
      @round = 0
    end
  end

  # On définit la méthode is_still_ongoing? pour qu'elle vérifie si le joueur humain est encore en vie ET s'il reste des ennemis à éliminer
  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies_in_sight.empty?
  end

  # On crée une méthode new_players_in_sight qui va rajouter des ennemis en vue en fonction d'un dé à 6 faces
  def new_players_in_sight
    # Si le nombre d'ennemis en vue est égal au nombre d'ennemis restants dans le jeu, on ne peut pas en rajouter
    if @enemies_in_sight.length == @players_left
      puts "Tous les joueurs sont déjà en vue"
    else
      # On lance un dé à 6 faces
      dice_result = rand(1..6)
      case dice_result
      when 1
        # Si le résultat est 1, aucun ennemi n'arrive
        puts "Aucun joueur adverse n'arrive"
      when 2, 3, 4
        # Si le résultat est 2, 3 ou 4, un nouvel ennemi arrive en vue
        new_player = Player.new("joueur#{rand(1..20)}", rand(1..20))
        # On ajoute le nouvel ennemi à l'array enemies_in_sight
        @enemies_in_sight << new_player
        # On affiche un message pour informer le joueur humain
        puts "Un nouveau joueur adverse arrive en vue : #{new_player.name} (#{new_player.life_points} points de vie)"
      when 5, 6
        # Si le résultat est 5 ou 6, deux nouveaux ennemis arrivent en vue
        2.times do
          new_player = Player.new("joueur#{rand(1..20)}", rand(1..20))
          # On ajoute les deux nouveaux ennemis à l'array enemies_in_sight
          @enemies_in_sight << new_player
          # On affiche un message pour informer le joueur humain
          puts "Deux nouveaux joueurs adverses arrivent en vue : #{new_player.name} (#{new_player.life_points} points de vie)"
        end
      end
    end
  end

  # On définit la méthode kill_player qui supprime un joueur du tableau enemies
  def kill_player(player)
    @enemies_in_sight.delete(player)
    puts "#{player.name} a été éliminé !"
  end

  # On définit la méthode show_players qui affiche l'état du joueur humain et le nombre d'ennemis restants
  def show_players
    @human_player.show_state
    puts "Il reste #{enemies_in_sight.length} ennemi(s) à vaincre !"
  end

  # On définit la méthode menu qui affiche les options de menu possibles pour le joueur
  def menu
    puts 
    puts "*******************Round #{@round += 1}**********************"
    puts
    puts "Fight !"
    puts
    puts "Quelle action veut tu effetuer ?"
    puts "1 - Chercher une meilleure arme"
    puts "2 - Chercher à se soigner"
    puts "3 - Attaquer un joueur en vue :"
  end
  

  # On définit la méthode menu_choice qui prend en entrée un choix de menu et effectue l'action correspondante
  def menu_choice(choice)
    case choice
    when 1
      @human_player.search_weapon
    when 2
      @human_player.search_health_pack
    when 3
      # Vérifie si des ennemis sont en vue
      if @enemies_in_sight.length > 0
        # Affiche la liste des ennemis
        puts "Quel ennemi veux-tu attaquer ?"
        @enemies_in_sight.each_with_index do |enemy, index|
          puts "#{index} - #{enemy.show_state}"
        end
        # Demande le choix du joueur
        puts
        index = gets.chomp.to_i
        # Si l'entrée est un nombre valide, on attaque l'ennemi correspondant
        if index < @enemies_in_sight.length
          @human_player.attacks(@enemies_in_sight[index])
          # Si l'ennemi est mort, on le supprime du tableau enemies
          kill_player(@enemies_in_sight[index])
        end
      else
        puts "Il n'y a aucun ennemi en vue."
      end
    else
      puts "Erreur de saisie, veuillez réessayer."
    end
  end
  1
  
  # On définit la méthode enemies_attack qui fait attaquer chaque ennemi restant le joueur humain
  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies_in_sight.each do |enemy|
      if is_still_ongoing?
        enemy.attacks(@human_player)
        kill_player(player) if enemy.life_points <= 0
      end
    end
  end

  # Cette méthode est appelée à la fin de la partie pour afficher le résultat final.
  def end_game
    # Affiche un message indiquant que la partie est terminée.
    puts "La partie est finie"
  
    # Vérifie si le joueur humain a encore des points de vie.
    if @human_player.life_points > 0
    # Si le joueur humain a encore des points de vie, affiche un message de victoire.
    puts "BRAVO ! TU AS GAGNE !"
    else
    # Sinon, affiche un message de défaite.
    puts "LOOSER ! GAME OVER!"
    end
  end
end

