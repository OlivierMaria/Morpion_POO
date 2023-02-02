# Board: this is the board. There must be an instance of this class in a game.
# when initializing the board, it must immediately instantiate 9 BoardCases (one per square).

# Instance variables: the Board must embed the 9 BoardCase of the game in order to be able to read and modify them easily.
# They must be assigned to it in the form of an array or a hash.
# Also, it is useful to count the number of moves played to easily identify if we arrive at the 9th move without a winner.

# Methods: the Board will take care of making the link between the BoardCases and the Game:
# it changes the values ​​of the BoardCases (from " " to "x" or "o")
# and checks according to the combination of BoardCases if the game is over (= a player has won or the 9 boxes are filled without a winner).

require_relative 'boardcase'
require_relative 'game'
require 'pry'

class Board
 attr_accessor :boardcases_hash, :turn_count, :victory_condition

 #On initialise la class Board
  def initialize 
    @turn_count = 1
    @boardcases_hash = Hash.new #on créé un hash qui va contenir les 9 Boardcases
    @victory_condition = false #on initialise la variable d'instance pour les conditions de victoire
    boardcase = BoardCase.new #on initialise la classe BoardCase
    #on fait une boucle pour intégrer les valeurs de chaque case dans une hash
    for x in (0..8) do
      @boardcases_hash[boardcase.position[x]] = boardcase.value[0]
    end    
  end

  #méthode pour vérifier si le coup jouer par le joueur est possible, si oui , il place son symbole dans la value correspondante à la key
  def player_selection_hash(boardcases_hash,selection,player_sign)
    if boardcases_hash.has_key?(selection) == true && boardcases_hash[selection] == " "
      boardcases_hash[selection] = player_sign ##<= recuperer la valeur du sign des players
      puts "Nous sommes au tour numéro #{@turn_count +=1}"
    else
      puts "C'est pas bon, ouvre tes yeux"
    end
  end

  #méthode pour déterminer les 9 conditions de victoires possibles
  def victory?(boardcases_hash)
    case !@victory_condition
      when boardcases_hash['A1'] == boardcases_hash['A2'] && boardcases_hash['A1'] == boardcases_hash['A3'] && boardcases_hash['A3'] != " "
        puts "Bien joué champion !"
      when boardcases_hash['B1'] == boardcases_hash['B2'] && boardcases_hash['B1'] == boardcases_hash['B3'] && boardcases_hash['B3'] != " "
        puts "Ramène la coupe à la maison"
      when boardcases_hash['C1'] == boardcases_hash['C2'] && boardcases_hash['C1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "Champion mon frère"
      when boardcases_hash['A1'] == boardcases_hash['B1'] && boardcases_hash['A1'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "Yeah !"
      when boardcases_hash['A2'] == boardcases_hash['B2'] && boardcases_hash['A2'] == boardcases_hash['C2'] && boardcases_hash['C2'] != " "
        puts "Le sourire de l'âne"
      when boardcases_hash['A3'] == boardcases_hash['B3'] && boardcases_hash['A3'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "Le charisme de Macron "
      when boardcases_hash['A1'] == boardcases_hash['B2'] && boardcases_hash['A1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "t'es un champion"
      when boardcases_hash['A3'] == boardcases_hash['B2'] && boardcases_hash['A3'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "t'as les biscoto de ronaldo !"
    else
      puts "Egalité ! on recommence ?"
      false
    end
  end

end
#binding.pry