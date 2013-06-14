require_relative 'flashcardcontroller.rb'
# require_relative 'flashcards.rb'

class FlashCardGame

  def initialize(deck)
    @deck = deck  
  end

  def run
    welcome
    print_definition
    guess_loop
    next_card_prompt
    print_definition
  end

private
  def welcome
    p "Welcome to Ruby Flash Cards.  To play, just enter the correct term for the each definition.  If you want to quit type in 'exit'.  Ready?  Go!"
  end

  def print_definition
    p "Definition:"
    pick_random_card
    p @deck.chosen_def
  end

  def pick_random_card
    @deck.pick_random_card
  end

  def guess_input
    puts "\n Guess: \n"
    word = gets.chomp
    return word
  end

  def guess_check
    if @deck.guess_check(guess_input)
      puts "Correct"
    else
      puts "Sorry wrong answer, try again."
    end
  end

  def guess_loop
    unless @deck.guess_check
      guess_input
      guess_check
    end
  end

  def next_card_prompt
    puts "Good Job! On to the next card!"
  end

end

game = FlashCardGame.new(FlashCardController.new(("flashcard_samples.txt")))
game.run
