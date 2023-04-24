class Player 
  attr_accessor :name, :life_points

  def initialize(name, life_points)
    @name = name # Le nom du joueur est initialisé
    @life_points = 10 # Le nombre de points de vie est initialisé
  end

  def show_state
    puts " il reste a #{name},#{life_points} points de vie " # Affichage des points de vie
  end

  def compute_damage
    return rand(1..6) # Calcul des dommages aléatoires (entre 1 et 6)
  end

  def gets_damage(damage)
    @life_points -= damage # Retrait des points de vie subis
    if @life_points <= 0
      puts "le joueur #{name} a été tué !" # Si le joueur n'a plus de points de vie, il est mort
    end
  end

  def attacks(player)
    puts "le joueur #{self.name} attaque le joueur #{player.name}" # Affichage de l'attaque
    damage = compute_damage # Calcul des dommages infligés
    player.gets_damage(damage) # Soustraction des points de vie au joueur attaqué
    puts "il lui a infliger #{damage} points de dommages" # Affichage des dommages infligés
  end
end


class HumanPlayer < Player #human player herite de la class player
  attr_accessor :weapon_level
  
  def initialize(name)
    super(name, 100)
    @weapon_level = 1
  end

  def show_state
    puts "il reste a#{@name},#{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level# Calcul des dommages aléatoires (entre 1 et 6)
  end

  def search_weapon
    weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level_found} !"  
  
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends"
    else
      puts "Mother fucker elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1
      puts "tu n'a rien trouvé"
    elsif health_pack.between?(2,5)# permet de verifier si le nombre et inclus entre 2 et 5 en incluant 2 et 5
      @life_points += 50
      @life_points = 100 if @life_points > 100 # si les point son > 100 renitialise les nombre a 100
    puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
    @life_points += 80
    @life_points = 100 if @life_points > 100
    puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end 