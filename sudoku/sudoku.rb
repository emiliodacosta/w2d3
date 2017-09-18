require 'colorize'
require 'colorized_string'

class Tile

  def initialize(value)
    @value=value
    value==0 ? @given=false : @given=true
  end

  def to_s
    if @given
      " #{@value} ".colorize(:red)
    else
      " ? "
    end
  end
end

class Board

  def self.from_file(file = "sudoku1.txt")
    arr=[]
    File.foreach(file) do |line|
      result = []
      num_arr = line.chomp.split("").map(&:to_i)
      num_arr.each do |num|
        result << Tile.new(num)
      end
      arr << result
    end
    Board.new(arr)
  end

  def initialize(grid)
    @grid = grid
  end

  def display
    @grid.each_with_index do |row, idx|
      result = "#{idx}) "
      row.each do |tile|
        result << tile.to_s
      end
      puts result
    end
    top_row = "   "
    @grid.length.times { |i| top_row << " #{i} "  }
    second_row = "   "
    @grid.length.times { |i| second_row << "___"  }
    puts second_row
    puts top_row
  end

  def solved?
    rows = @grid
    columns = @grid.transpose
    subgrids = []
    for i in [0, 3, 6]
      for x in [0, 3, 6]
        subarray = []
        for z in (i..i+2)
          subarray += @grid[z][x..x+2]
        end
        subgrids << subarray
      end
    end

    tocheck = rows + columns + subgrids

    tocheck.each do |line|
      line = line.map{ |tile| tile.value }
      return false unless line == line.uniq
      return false unless line.each{ |num| (1..9).include? num }
    end

    true

  end


  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, newVal)
    x, y = pos
    @grid[x][y] = newVal
  end
end

a = Board.from_file
a.display
