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
      expect(@board.add('X', "A1")).to eq([
                                               { "1": 'X', "2": '', "3": '' },
                                               { "1": '',  "2": '', "3": '' },
                                               { "1": '',  "2": '', "3": '' }
                                             ])
    end

    it 'can add an O to the board at A 1' do
      expect(@board.add('O', "A1")).to eq([
                                               { "1": 'O', "2": '', "3": '' },
                                               { "1": '',  "2": '', "3": '' },
                                               { "1": '',  "2": '', "3": '' }
                                             ])
    end

    it 'can add an X to the board at A 2' do
      expect(@board.add('X', "A2")).to eq([
                                               { "1": '', "2": 'X', "3": '' },
                                               { "1": '', "2": '',  "3": '' },
                                               { "1": '', "2": '',  "3": '' }
                                             ])
    end

    it 'can add an O to the board at B 1' do
      expect(@board.add('O', "B1")).to eq([
                                               { "1": '', "2": '',  "3": '' },
                                               { "1": 'O', "2": '', "3": '' },
                                               { "1": '',  "2": '', "3": '' }
                                             ])
    end

    it 'can add an X to the board at C 2' do
      expect(@board.add('X', "C2")).to eq([
                                               { "1": '', "2": '',  "3": '' },
                                               { "1": '', "2": '',  "3": '' },
                                               { "1": '', "2": 'X', "3": '' }
                                             ])
    end

    it 'can add an O to the board at C 3 and then an X at A 1' do
      @board.add('X', "A1")
      expect(@board.add('O', "C3")).to eq([
                                               { "1": 'X', "2": '',  "3": '' },
                                               { "1": '',  "2": '',  "3": '' },
                                               { "1": '',  "2": '',  "3": 'O' }
                                             ])
    end

    # it 'cannot add a piece to a spot that has been taken' do
    #   @board.add("X", "A1")
    #   expect(@board.add("X", "A1")).to eq("Cannot Add piece to a spot that has been taken")
    # end
  end

end
