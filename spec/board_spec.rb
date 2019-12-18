# Acceptance Criteria:
#   Should be a 3 x 3 board
#   Should tell when the board is full
#   Prevents players from placing a piece in the same spot more than once

require 'board'

describe Board do
  before(:each) do
    @board = Board.new
  end
  context 'adding a piece' do
    it 'should add an X to the board at A 1' do
      expect(@board.add("X", ["A", "1"])).to eq([
        {"1": "X", "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}
      ]) 
    end

    it 'should add an O to the board at A 1' do
      expect(@board.add("O", ["A", "1"])).to eq([
        {"1": "O", "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}
      ]) 
    end

    it 'should add an X to the board at A 2' do
      expect(@board.add("X", ["A", "2"])).to eq([
        {"1": "", "2": "X", "3": ""}, 
        {"1": "",  "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}
      ]) 
    end
  end
end