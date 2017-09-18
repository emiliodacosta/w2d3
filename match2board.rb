class Board

  attr_reader :gridSize

  def initialize(num=2)
    @gridSize = num #make this always even!
    @grid = Array.new(@gridSize){ Array.new(@gridSize) }
    self.populate
  end


  def populate
    cardcount = (@gridSize ** 2) / 2
    deck=[]
    cardcount.times do |i|
      2.times {deck << Card.new(i+1)}
    end
    deck.shuffle!

    @grid.each do |row|
      row.each_with_index do |n, i|
        row[i] = deck.pop
      end
    end
  end

  def render
    @grid.each do |row|
      row_string = ""
      row.each do |card|
        if card.facedown
          row_string << " ? "
        else
          row_string << " #{card.value} "
        end
      end
      puts row_string
    end
    puts ""
  end

  def won?
    @grid.flatten.all? {|card| card.facedown==false}
  end

  def toggle(card)
    card.flipCard
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end


end
