class FlashCard
  attr_reader :definition, :word

  def initialize(info)
    @definition = info[:definition]
    @word = info[:word]
  end

end

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

    data = data.split("\n")
    data.delete(" ")

    data.each_slice(2)
    
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
