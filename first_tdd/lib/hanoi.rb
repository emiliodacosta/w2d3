class Hanoi

  attr_accessor :arr

  def initialize(arr = [[0, 1, 2, 3], [], []])
    @arr = arr
  end

  def run
    until won?
      render
      begin
        std = get_input
        puts "\t std:#{std}"
        valid_move?(std)
      rescue
        raise "Invalid move"
        retry
      end
      move(std)
    end
    puts "You win!"
    puts "\n"
    puts "╭∩╮(Ο_Ο)╭∩╮   ╭∩╮(Ο_Ο)╭∩╮"
    puts "\n"
    puts "<('.' <) <('.')> (> '.')>"
  end

  def get_input
    print "Please select your origin and destination: "
    input = gets.chomp.split(" ")
    origen = input[0].to_i
    destino = input[1].to_i
    [origen, destino]
  end

  def valid_move?(input)
    raise "Invalid move" if input.any? {|el| el.between?(0,2) != true }
    raise "Invalid move" if @arr[input[0]].empty?
    raise "Invalid move" if input[0] == input[1]
    raise "Invalid move" if @arr[input[1]].first &&
    @arr[input[0]].first > @arr[input[1]].first
  end

  def move(input)
    x,y = input
    @arr[y].unshift(@arr[x].shift)
    @arr
  end

  def won?
    return true if @arr[0].empty? && @arr[1].empty?
    false
  end

  def render
    puts "THE TOWERS OF HANOI GAME !!! 1111 WUN !!! 1"
    puts "\n"
    puts "╭∩╮(Ο_Ο)╭∩╮   ╭∩╮(Ο_Ο)╭∩╮"
    puts "\n"
    puts "<('.' <) <('.')> (> '.')>"
    puts "\n"
    @arr.each {|stack| p stack}
  end
end
