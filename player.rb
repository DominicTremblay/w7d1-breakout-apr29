class Player

  # shortcuts for getters and setters
  attr_reader :name, :ap
  attr_accessor :hp

  def initialize name
    @name = name
    @ap = 10
    @hp = 20
  end

  # # getter for name
  # def name
  #   @name
  # end

  # def ap
  #   @ap
  # end

  # def hp
  #   @hp
  # end

  # # setter
  # def hp=(point)
  #   @hp=point
  # end

  def attacks(ennemy)
   puts "#{name} attacks #{ennemy.name}"
   damage_points = rand(ap) + 1 
   ennemy.takes_damage(damage_points)
  end

  def takes_damage(points)
    puts "#{name} takes #{points} points of damage!"
    self.hp = self.hp - points
  end

  def dead? 
    hp <= 0
  end

end