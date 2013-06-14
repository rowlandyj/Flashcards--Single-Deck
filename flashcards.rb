class FlashCard
  attr_reader :definition, :word

  def initialize(info)
    @definition = info[:definition]
    @word = info[:word]
  end

end
