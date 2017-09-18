require "hanoi"

describe Hanoi do

  subject(:hanoi) { Hanoi.new }

  describe "#move" do
    it "moves the discs" do
      expect(hanoi.move([0, 1])).to eq([[1, 2, 3], [0], []])
      hanoi.move([0, 1])
    end

    it "raises an error in the case of an invalid move" do
      expect { hanoi.valid_move?([9001, 9002]) }.to raise_error("Invalid move")

    end
  end

  describe "#won?" do
    let(:hanoi) { Hanoi.new([[], [], [0, 1, 2, 3]]) }

    it "determines if the game has been won" do
      expect(hanoi.won?).to eq(true)
      hanoi.won?
    end
  end
end
