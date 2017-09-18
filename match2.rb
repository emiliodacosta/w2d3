require_relative "match2player"
require_relative "match2card"
require_relative "match2board"

class Game

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    until @board.won?
      playturn
    end
    puts "Game over! Wasn't that fun?"
  end

  def playturn
    display
    guess1, card1 = get_move
    #@player.revealed_card(guess1, card1)
    display
    guess2, card2 = get_move
    #@player.revealed_card(guess1, card1)
    if card1 == card2
      puts "Please select unique locations for your two guesses."
      @player.instance_of?(PlayerAI) ? sleep(0.1) : sleep(1.5)
      card1.flipCard
      card2.flipCard
      playturn

    elsif card1.value == card2.value
      display
      card1.revealed
      card2.revealed
    else
      card1.flipCard
      card2.flipCard
      puts "Incorrect guess!"
      @player.instance_of?(PlayerAI) ? sleep(0.1) : sleep(1.5)
    end
  end

  def get_move
    guess = @player.get_move(@board.gridSize)
    card = @board[guess]
    if card.revealed?
      puts "You've already revealed the card at that location."
      get_move
    else
      card.flipCard
      [guess, card]
    end
  end

  def display
    system("clear")
    @board.render
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new(6)
  p1 = Player.new("Bobby")
  p2 = PlayerAI.new(board)
  Game.new(board, p2).play
end
