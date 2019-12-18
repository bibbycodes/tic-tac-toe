# frozen_string_literal: true

# Acceptance Criteria:
#   is a 3 x 3 board
#   can tell when the board is full
#   Prevents players from placing a piece in the same spot more than once
#   Players can add a piece to the board

require 'board'

describe Board do
  context 'adding a piece to the board' do
    before(:each) do
      @board = Board.new
    end
    it 'can add an X to the board at A 1' do
      expect(@board.add('X', 'A1')).to eq([
                                            { "1": 'X', "2": '', "3": '' },
                                            { "1": '',  "2": '', "3": '' },
                                            { "1": '',  "2": '', "3": '' }
                                          ])
    end

    it 'can add an O to the board at A 1' do
      expect(@board.add('O', 'A1')).to eq([
                                            { "1": 'O', "2": '', "3": '' },
                                            { "1": '',  "2": '', "3": '' },
                                            { "1": '',  "2": '', "3": '' }
                                          ])
    end

    it 'can add an X to the board at A 2' do
      expect(@board.add('X', 'A2')).to eq([
                                            { "1": '', "2": 'X', "3": '' },
                                            { "1": '', "2": '',  "3": '' },
                                            { "1": '', "2": '',  "3": '' }
                                          ])
    end

    it 'can add an O to the board at B 1' do
      expect(@board.add('O', 'B1')).to eq([
                                            { "1": '', "2": '',  "3": '' },
                                            { "1": 'O', "2": '', "3": '' },
                                            { "1": '',  "2": '', "3": '' }
                                          ])
    end

    it 'can add an X to the board at C 2' do
      expect(@board.add('X', 'C2')).to eq([
                                            { "1": '', "2": '',  "3": '' },
                                            { "1": '', "2": '',  "3": '' },
                                            { "1": '', "2": 'X', "3": '' }
                                          ])
    end

    it 'can add an O to the board at C 3 and then an X at A 1' do
      @board.add('X', 'A1')
      expect(@board.add('O', 'C3')).to eq([
                                            { "1": 'X', "2": '',  "3": '' },
                                            { "1": '',  "2": '',  "3": '' },
                                            { "1": '',  "2": '',  "3": 'O'}
                                          ])
    end

    context 'validation' do
      it 'cannot add a piece to a spot that has been taken' do
        @board.add("X", "A1")
        expect(@board.add("X", "A1")).to eq("Invalid Move")
      end
  
      it 'cannot add a piece other than X or O' do
        expect(@board.add("D", "A1")).to eq("Invalid Move")
      end
  
      it 'cannot add a piece to a spot outside the board' do
        expect(@board.add("X", "D4")).to eq("Invalid Move")
      end
    end

    context '#full?' do
      it 'returns true if the board is full' do
        for i in 1..3
          @board.add("X", "A#{i}")
          @board.add("X", "B#{i}")
          @board.add("X", "C#{i}")
        end
      expect(@board.full?).to be(true)
      end

      it 'returns false if the board is not full' do
        for i in 1..3
          @board.add("X", "A#{i}")
        end
      expect(@board.full?).to be(false)
      end
    end
  end
end
