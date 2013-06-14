require_relative 'flashcards.rb'

class FlashCardController
  attr_reader :cards, :chosen_def, :chosen_word

  def initialize(filename)
    @filename = filename
    @cards = []
    @chosen_word = nil
    @chosen_def = nil
    self.get_cards
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
    @cards.sample
    @chosen_def = chosen_card.definition
    @chosen_word = chosen_card.word
  end

  def check_guess(answer_string)
    answer_string == @chosen_word
   end

  def to_s
    @cards.each {|card| puts "Description:\n#{card.definition}\nAnswer: #{card.word}\n\n"}
  end
end

card = FlashCardController.new("flashcard_samples.txt")
card.to_s


