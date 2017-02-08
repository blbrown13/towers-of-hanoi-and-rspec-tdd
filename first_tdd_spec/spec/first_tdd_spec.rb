require 'first_tdd'

describe Array do

  describe '#my_uniq' do
    subject(:array) { [1,2,1,3,3] }

    it 'should call my_uniq on self' do
      expect(array.class).to eq(Array)
    end

    it 'should return an array with unique elements' do
      expect(array.my_uniq).to eq([1,2,3])
    end

    it 'should return elements in the order they first appeared' do
      expect(array.my_uniq).to eq([1,2,3])
    end
  end

  describe '#two_sum' do
    subject(:array) { [-1,0,2,-2,1] }

    it 'should return an array of index pairs that sum to zero' do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
    # doesn't return spurious zeros
    # checks nil array
    # checks array length 1
    # checks for original order
  end

  describe '#my_transpose' do
    subject(:array) { [[0, 1, 2], [3, 4, 5],[6, 7, 8]] }

    it 'should return a transposed array' do
      expect(array.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    # checks nil array
    # checks array length 1
    # doesn't use transpose method
    # behavior from elements of not same length
  end
end

describe "Stock Picker" do
  subject(:array) { [1,3,5,2,9] }

  let(:array4) { [1] }

  describe '#stock_picker' do
    it 'returns an array containing indices of minimum and maximum values' do
      expect(stock_picker(array)).to eq([0,4])
    end

    it 'returns indices correctly from a shuffled array' do
      array2 = [3, 5, 9, 1, 2]
      expect(stock_picker(array2)).to eq([3,2])
    end

    it 'throws an error if given a negative number' do
      array3 =  [-2, -1, 0, 3, -5]
      expect {stock_picker(array3)}.to raise_error(ArgumentError)
    end

    it 'returns nil if array contains less than two elements' do
      expect(stock_picker(array4)).to eq(nil)
    end

  end
end
