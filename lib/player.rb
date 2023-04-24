class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points)
    @name = name # initialisation du nom du joueur
    @life_points = 10 # initialisation du nombre de points de vie
  end

  def show_state
    puts "il reste a #{name},#{life_points} points de vie " # affichage des points de vie du joueur
  end

  def compute_damage
    return rand(1..6) # calcul de dommages aléatoires compris entre 1 et 6
  end

  def gets_damage(damage)
    @life_points -= damage # soustrait les points de vie subis
    if @life_points <= 0
      puts "le joueur #{name} a été tué !" # affichage si le joueur n'a plus de points de vie
    end
  end

  def attacks(player)
    puts "#{self.name} attaque le joueur #{player.name}" # affichage de l'attaque entre les deux joueurs
    puts
    damage = compute_damage # calcul des dommages infligés
    player.gets_damage(damage) # soustraction des points de vie du joueur attaqué
    puts "#{name} a infliger #{damage} points de dommages" # affichage des dommages infligés
  end
end
