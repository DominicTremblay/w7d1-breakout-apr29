class Player

  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name = name
    @hp = 20
    @ap = 10 
  end

  def dead? 
    hp <= 0
  end 

  def status
    "Player: #{name} HP: #{hp}/20 #{dead? ? 'DEAD':nil}"
  end

  def attacks(ennemy)
      puts "#{name} attacks #{ennemy.name}"
      damage = rand(ap) + 1
      ennemy.takes_damage(damage)
  end

  def takes_damage(damage)
    puts "#{name} takes #{damage} points of damage"
    @hp -= damage
  end
end