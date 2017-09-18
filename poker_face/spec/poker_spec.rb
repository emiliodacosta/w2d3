require "poker"

describe Poker do

  subject(:poker) { Poker.new([1,2,3,4]) }

  describe "#initialize" do

    it "should setdeck to 52 cards" do
      expect(poker.deck).to eq(poker.deck.length == 52)
    end

    it "should set the number of players" do
      expect(poker.players).not_to be_nil
    end

    it "deals 5 cards to each player" do

    end
  end


end
