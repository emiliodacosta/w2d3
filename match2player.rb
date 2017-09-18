class Player
  def initialize(name="Bob")
    @name = name
  end

  def get_move(gridSize)
    puts "Please enter a row\# and col\# (x, y): "
    input = gets.chomp.split(", ").map(&:to_i)
    2.times { |i| input[i] -= 1 }

    if validate_move?(input, gridSize)
      return input
    else
      get_move(gridSize)
    end
  end

  def validate_move?(input, gridSize)
    return false unless input.length == 2
    input.all? do |num|
      (0...gridSize).include?(num)
    end
  end
end

class PlayerAI < Player

  def initialize(board)
    @board = board
    @gridSize = board.gridSize
  end

  def get_move(gridSize)
    possible_moves = []

    for x in (0...@gridSize)
      for y in (0...@gridSize)
        possible_moves << [x, y] unless @board[[x,y]].revealed?
      end
    end
    possible_moves.sample
  end

end
