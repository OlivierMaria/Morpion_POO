# Application: this class will allow us to launch the game.
# It will make an infinite loop of games (we play as long as the players want to continue) and launch the instantiation of a Game.

require_relative 'game'
require_relative 'show'


class Application
  attr_accessor :game, :board_to_show, :hash

  #on initialise la partie
  def initialize
    first_board = Show.new.initial_board #on affiche le tableau initiale pour voir quel coup jouer
    @game = Game.new
    @hash = @game.grid.boardcases_hash #affiche le hash avec les coups joués
    perform
  end
  
  #méthode avec une boucle qui continue tant qu'il n'y à pas de gagnant ou d'égalité
  def party
    while @game.is_going? == true
      showing_board
       @game.player_selection
       @game.is_going?
     end
  end

  #méthode pour afficher l'état du plateau de jeu
  def showing_board
    @board_to_show = Show.new.show_board(hash)
  end

  def perform
     party
     showing_board
  end
   
  #binding.pry

end