require_relative 'flashcard_samples.txt'
require_relative 'flashcards.rb'
require_relative 'flashcardgame.rb'

class FlashCardController
  attr_reader :cards

  def initialize(filename)
    @cards = []
    @filename = filename
  end

  def load
    file = File.open(@filename,"r")
    data = file.read
    file.close
    all_data = []

    data = data.split("\n")
    data.delete(" ")

    all_data = Array.new((data.length/2)) {data.shift(2)}
  end

  def to_s
    @cards.each do |line|
      puts line
    end
  end
end

card = FlashCardController.new("flashcard_samples.txt")

card.load

puts card
