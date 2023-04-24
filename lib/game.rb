require_relative 'player'
require_relative 'human_player'

class Game 
  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name, 100)
    @enemies = []
    4.times do |i|
      @enemies << Player.new("ennemi #{i+1}", rand(1..20))
    end
  end
  
  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty?
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{enemies.length} ennemi(s) à vaincre !"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "1 - Chercher une meilleure arme"
    puts "2 - Chercher à se soigner"
    puts "3 - Attaquer un joueur en vue :"
    @enemies.each_with_index do |enemy, i|
      print "#{i} - "
      enemy.show_state
    end
  end

  def menu_choice(input)
    case input
    when "1"
      @human_player.search_weapon
    when "2"
      @human_player.search_health_pack
    else
      index = input.to_i
      if index < @enemies.length
        @human_player.attacks(@enemies[index])
        kill_player(@enemies[index]) if @enemies[index].life_points <= 0
      end
    end
  end

  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do |enemy|
      if is_still_ongoing?
        enemy.attacks(@human_player)
      end
    end
  end

  def end
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "LOOSER ! GAME OVER!"
    end
  end
end
