require 'towers_of_hanoi'

describe 'Towers of Hanoi' do
  subject(:game) { TowersOfHanoi.new }

  # split contexts: check if towers are passed in during init or not

  describe '#initialize' do
    it 'should initialize with an array containing three arrays' do
      expect(game.towers.class).to eq(Array)
    end

    it 'should populate first tower with three discs' do
      expect(game.towers.first.length).to eq(3)
    end

    it 'should have zero discs in remaining towers' do
      expect(game.towers[1].all? { |n| n.nil?} ).to be(true)
      expect(game.towers[2].all? { |n| n.nil?} ).to be(true)
    end
  end


  describe '#valid_move?' do
    context 'when moving a disc to an empty tower' do
      it 'should return true' do
        expect(game.valid_move?(1,2)).to be(true)
      end
    end

    context 'when moving from an empty tower to an empty tower' do
      it 'should return false' do
        expect(game.valid_move?(2,3)).to be(false)
      end
    end

    context 'when moving smaller disc to a larger disc' do
      before(:each) do
        game.move_disc(1,2)
        game.move_disc(1,3)
      end
      it 'should return true' do
        expect(game.valid_move?(2,3)).to be(true)
      end
    end

  end

  describe '#user_input' do
    context 'when taking from an empty tower' do
      it "should return true" do
        expect {game.input_errors(2,1)}.to raise_error("Can't take from an empty tower")
      end
    end

    # check if < 1

    context 'when input is not a number between one and three' do
      it 'should return false' do
        expect {game.input_errors(1,4)}.to raise_error(ArgumentError)
      end
    end

    context 'when input contains anything other than a number' do
      it 'should return false' do
        expect {game.input_errors('one',4)}.to raise_error(ArgumentError)
      end
    end

  end

  describe '#game_over?' do
    context "when the first tower is full" do
      it 'should return false' do
        expect(game.game_over?).to be(false)
      end
    end

    context 'when another tower is full' do
      let(:game) { TowersOfHanoi.new( [ [], [3,2,1], [] ] )}
      it 'should return true' do
        expect(game.game_over?).to be(true)
      end
    end
  end

end
