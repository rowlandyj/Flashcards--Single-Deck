require_relative 'flashcards.rb'
require_relative 'flashcardgame.rb'

class FlashCardGame

  def initialize(deck=FlashCardController.new("flashcard_samples.txt"))
    @deck = deck  
  end

  def run
    welcome
    print_definition
  end

private
  def welcome
    p "Welcome to Ruby Flash Cards.  To play, just enter the correct term for the each definition.  If you want to quit type in 'exit'.  Ready?  Go!"
  end

  def print_definition
    p "Definition:"
    pick_random_card
    p @deck.def
  end

  def pick_random_card
    @deck.pick_random_card
  end

end

game = FlashCardController.new(("flashcard_samples.txt"))
game.run
