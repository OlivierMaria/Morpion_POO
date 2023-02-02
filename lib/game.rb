require'pry'
require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game
	attr_accessor :grid, :players, :game_status, :selection

  #on initialise la classe Game
	def initialize
	  @players = []
    @grid = Board.new
    @grid.turn_count = 1
    creating_players
    player_selection
	end

  #méthode pour créer les joueurs
  def creating_players
    @players << Player.new("x")
    @players << Player.new("o")
  end

  #Défini qui doit jouer en fonction du numéro du tour
  def who_is_playing?
    if @grid.turn_count.odd?
      @players[0]
    else
      @players[1]
    end
  end

  #vérifie le statut de la partie
  def is_going?
    if @grid.victory?(@grid.boardcases_hash) == false && @grid.turn_count < 10
      true
    else
      false
    end
  end

  #ce qu'un joueur va jouer
  def player_selection
    player_name = who_is_playing?
    puts "C'est quoi ton moove #{player_name.name}?"
    print ">" 
    @selection = gets.chomp
    checking_selection
  end

  def checking_selection
    @grid.player_selection_hash(@grid.boardcases_hash, @selection, who_is_playing?.sign)
  end


end


#binding.pry