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
    it 'should add an X to the board' do
      expect(@board.add("X", ["A", "0"])).to eq([
        {"1": "X", "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}, 
        {"1": "",  "2": "", "3": ""}
      ]) 
    end
  end
end