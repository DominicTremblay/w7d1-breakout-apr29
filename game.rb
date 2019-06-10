require_relative './player'
require_relative './turn'

class Game

  def initialize 
    @player1 = Player.new "Mario"
    @player2 = Player.new "Luigi"
    @player3 = Player.new "Yoshi"
    @player4 = Player.new "Princess Peach"
    @players = [@player1, @player2, @player3, @player4]
    @turn = Turn.new(@players)
  end

  def game_over?
    @players.select{|player| !player.dead?}.count == 1
  end

  def game_status
  
      puts ""
      puts "-------- Status ---------"
      puts @players.map {|player| player.status }
      puts ""
    
  end

  def winner 
    @players.detect{|player| !player.dead?}
  end

  def end_game
    puts '--------------'
    puts '   GAME OVER  '
    puts '--------------'
    winner = @players.find{|player| !player.dead?}
    puts "#{winner.name} won!"

  end

  def run
    until (game_over?) do    
      @turn.next_round
      current_player = @turn.current_player
      ennemy_player = @turn.ennemy_player
      current_player.attacks(ennemy_player)
      game_status
      sleep 0.7
    end
    
    end_game
  end


end