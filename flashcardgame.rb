require_relative 'flashcardcontroller.rb'
# require_relative 'flashcards.rb'

class FlashCardGame

  def initialize(deck)
    @deck = deck
    @exit = false 
  end

  def run
    welcome
    until @exit
      print_definition
      guess_loop
      next_card_prompt
    end
  end

private
  def welcome
    puts "Welcome to Ruby Flash Cards.  To play, just enter the correct term for the each definition.  If you want to quit type in 'exit'.  Ready?  Go!"
  end

  def print_definition
    puts "Definition:"
    pick_random_card
    puts @deck.chosen_def
  end

  def pick_random_card
    @deck.pick_random_card
  end

  def guess_input
    puts "\n Guess: \n"
    word = gets.chomp
    @exit = true if word == 'exit'
    return word
  end

  def guess_check
    if @deck.check_guess(guess_input)
      puts "Correct" 
      return true
    else
      puts "Sorry wrong answer, try again."
    end
  end

  def guess_loop
    until guess_check
      break if @exit
    end
  end

  def next_card_prompt
    puts "Good Job! On to the next card!"
  end

end

game = FlashCardGame.new(FlashCardController.new("flashcard_samples.txt"))
game.run
