require 'display'

describe Display do
  before(:each) do
    @display = Display.new
    @empty_layout = {
      'A' => { "1": ' ',  "2": ' ', "3": ' ' },
      'B' => { "1": ' ',  "2": ' ', "3": ' ' },
      'C' => { "1": ' ',  "2": ' ', "3": ' ' }
    }

    @stalemate_layout = {
      'A' => { "1": 'X',  "2": 'O', "3": 'X' },
      'B' => { "1": 'O',  "2": 'X', "3": 'O' },
      'C' => { "1": 'O',  "2": 'X', "3": 'O' }
    }

    @win_row_b_x = {
      'A' => { "1": ' ', "2": 'O', "3": 'O' },
      'B' => { "1": 'X', "2": 'X', "3": 'X' },
      'C' => { "1": 'O', "2": ' ', "3": 'O' }
    }

    @win_col_1_o = {
      'A' => { "1": 'O',  "2": ' ', "3": 'X' },
      'B' => { "1": 'O',  "2": 'X', "3": ' ' },
      'C' => { "1": 'O',  "2": ' ', "3": 'X' }
    }
  end

  let(:empty_board) { double('Board', layout: @empty_layout) }
  let(:stalemate_board) { double('Board', layout: @stalemate_layout) }
  let(:all_bx) { double('Board', layout: @win_row_b_x) }
  let(:col_1_o) { double('Board', layout: @win_col_1_o) }
  
  context '#render' do
    it 'renders an empty board layout' do
      expect(@display.show(empty_board)).to eq(
        [
          "   |   |   ",
          '---+---+---',
          "   |   |   ",
          '---+---+---',
          "   |   |   "
        ]
      )
    end
  end
end