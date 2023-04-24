require_relative 'player' # Charge la classe Player

class HumanPlayer < Player # Déclare une sous-classe de Player appelée HumanPlayer
  attr_accessor :weapon_level # Crée un accesseur pour la variable weapon_level
  
  def initialize(name, life_points) # Initialise la classe avec un nom et des points de vie
    super(name, life_points) # Appelle le constructeur de la classe parente avec les arguments fournis
    @life_points = 100 # Initialise les points de vie à 100
    @weapon_level = 1 # Initialise le niveau de l'arme à 1
  end

  def show_state # Affiche l'état actuel du joueur
    puts "#{@name}, a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage # Calcule les dégâts causés par le joueur
    return rand(1..6) * @weapon_level # Les dégâts sont aléatoires entre 1 et 6, multipliés par le niveau de l'arme
  end

  def search_weapon # Cherche une nouvelle arme
    weapon_level = rand(1..6) # Génère un niveau d'arme aléatoire entre 1 et 6
    puts "Tu as trouvé une arme de niveau #{weapon_level}!" # Affiche le niveau de l'arme trouvée
    if weapon_level > @weapon_level # Si l'arme trouvée est meilleure que l'arme actuelle
      @weapon_level = weapon_level # Met à jour le niveau de l'arme
      puts "What the fuck ! Elle est meilleure que ton arme actuelle : tu la prends!" # Affiche un message d'encouragement
    else # Sinon
      puts "Mother fucker elle n'est pas mieux que ton arme actuelle..." # Affiche un message de déception
    end
  end

  def search_health_pack # Cherche un pack de santé
    health_pack = rand(1..6) # Génère un nombre aléatoire entre 1 et 6
    if health_pack == 1 # Si le nombre est 1
      puts "Tu n'as rien trouvé..." # Affiche un message d'échec
    elsif health_pack.between?(2, 5) # Sinon, si le nombre est compris entre 2 et 5
      @life_points += 50 # Ajoute 50 points de vie
      @life_points = 100 if @life_points > 100 # Si les points de vie dépassent 100, les met à 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !" # Affiche un message de réussite
    else # Sinon
      @life_points += 80 # Ajoute 80 points de vie
      @life_points = 100 if @life_points > 100 # Si les points de vie dépassent 100, les met à 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !" # Affiche un message de réussite
    end
  end
end
