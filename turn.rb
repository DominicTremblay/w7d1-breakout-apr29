class Turn

  attr_reader :current_player, :ennemy_player
  attr_accessor :round

  def initialize(players)
    @players = players.shuffle
    @round = 0
    @current_player = nil
    @ennemy_player = nil
  end

  def get_current_player
    @players.select{|player| !player.dead?}.first
  end

  def get_ennemy_player(current)
    @players.select{|player| !player.dead? && player != current}.sample
  end

  def next_round
    @current_player = get_current_player
    @ennemy_player = get_ennemy_player(@current_player)
    @round += 1
    @players.rotate!
  end

end