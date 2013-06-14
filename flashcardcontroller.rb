require_relative 'flashcards.rb'
require_relative 'flashcardgame.rb'

class FlashCardController
  attr_reader :cards, :chosen_word, :chosen_def

  def initialize(filename)
    @cards = []
    @filename = filename
    @chosen_word = nil
    @chosen_def = nil
  end

  def load
    file = File.open(@filename,"r")
    data = file.read
    file.close
    all_data = []

    data = data.split("\n")
    data.delete(" ")

    all_data = Array.new((data.length/2)) {data.shift(2)}
    return all_data
  end

  def get_cards
    load.each do |card|
      @cards << FlashCard.new(card)
    end
    @cards
  end

  def pick_random_card
    chosen_card = @cards.sample
    @chosen_def = chosen_card.definition
    @chosen_word = chosen_card.word
  end

  def check_guess(input)
    if input == @chosen_word
      return true
    else
      false
    end
  end

  def to_s
    @cards.each do |line|
      puts line
    end
  end
end

card = FlashCardController.new("flashcard_samples.txt")

# card.load
# card.get_cards
# card.pick_random_card

