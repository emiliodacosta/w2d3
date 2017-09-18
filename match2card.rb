class Card

  attr_reader :value, :facedown

  def initialize(value)
    @value = value
    @facedown = true
    @revealed = false
  end

  def flipCard
    @facedown = !@facedown
  end

  def revealed
    @revealed = true
  end

  def revealed?
    @revealed
  end

end
