# BoardCase: A Boardcase is a case. 9 in one game.

# Instance variables: a Boardcase is defined by its position (A1, B2, B3, etc.) and its content (Either it is empty,
# either it has the string "x" as its value, or it has the string "o" as its value).

require 'pry'
class BoardCase
  attr_accessor :position, :value

  # on initilise deux Arrays : un comprenant toutes les positions, l'autre les trois valeurs possibles.
  def initialize(value = " ")
    @position = ["A1", "A2","A3","B1","B2","B3","C1","C2","C3"]
    @value = [" ", "x", "o"]
  end

end