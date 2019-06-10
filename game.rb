require_relative './player'
require_relative './turn'

class Game

  # constructor
  def initialize
    @player1 = Player.new 'Mario'
    @player2 = Player.new 'Luigi'
    @player3 = Player.new 'Yoshi'
    @player4 = Player.new 'Princess Peach'
    @players = [@player1, @player2, @player3, @player4]
    @turn = Turn.new(@players)
  end

  def status
      puts '--------- Status ----------'
      puts @players.map.with_index {|player, index| "Player#{index+1}: #{player.name} HP: #{player.dead? ? 'DEAD!': player.hp} "}
  end

  def game_over?
    @players.select{|player| !player.dead?}.count == 1
  end

  def winner
    @players.find{|player| !player.dead?}
  end

  def end_game
    puts '------- GAME OVER -------'
    puts "#{winner.name} has won!"
  end


  def run
    until (game_over?) do
      @turn.next_round
      puts "-------- Round##{@turn.round} ------------"
      current_player = @turn.get_current_player
      ennemy_player = @turn.get_ennemy_player(current_player)
      current_player.attacks(ennemy_player)
      status
      sleep 1
      puts
    end

    end_game

  end


end