require "first_tdd"

describe Array do

  subject(:arr) { Array.new([1, 2, 2, 3, -3]) }
  let(:arr2d) { Array.new([[1, 2, 3],[4, 5, 6]]) }
  let(:arr_profit) { Array.new([8, 2, 1, 8, 2]) }

  describe '#my_uniq' do

    it 'should remove duplicates' do
      expect(arr.my_uniq).to eq([1, 2, 3, -3])
      arr.my_uniq
    end

  end

  describe '#two_sum' do
    it "find ordered positions of elements that sum to 0 " do
      expect(arr.two_sum).to eq([[3, 4]])
      arr.two_sum
    end
  end

  describe "#my_transpose" do
    it "transposes the array" do
      expect(arr2d.my_transpose).to eq([[1,4],[2,5],[3,6]])
      arr2d.my_transpose
    end
  end

  describe "#stock_picker" do
    it "most profitable pair without time travel" do
      expect(arr_profit.stock_picker).to eq([2,3])
      arr_profit.stock_picker
    end
  end

end
