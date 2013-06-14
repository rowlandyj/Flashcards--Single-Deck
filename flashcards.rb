class FlashCard
  attr_reader :definition, :word

  def initialize(info)
    @definition = info[0]
    @word = info[1]
  end

end
