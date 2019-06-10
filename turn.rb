class Turn

  attr_reader :current_player, :ennemy_player

  def initialize(players)
    @players = players.shuffle
    @round = 1
    @current_player = nil
    @ennemy_player = nil
  end

  def get_ennemy_player(current)
    @players.select{|player| player != current && !player.dead?}.sample
  end

  def get_current_player
    @players.select{|player| !player.dead?}.first
  end

  def next_round
    puts "-------Round##{@round}---------"
    @current_player = get_current_player
    @ennemy_player = get_ennemy_player(@current_player)
    @round += 1;
    @players.rotate!
  end
end