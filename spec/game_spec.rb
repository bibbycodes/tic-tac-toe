# frozen_string_literal: true
# The rules of tic-tac-toe are as follows:
# There are two players in the game (X and O)
# Players take turns until the game is over
# A player can claim a field if it is not already taken
# A turn ends when a player claims a field
# A player wins if they claim all the fields in a row, column or diagonal
# A game is over if a player wins
# A game is over when all fields are taken
# Build the business logic for a game of tic tac toe.
# It should be easy to implement a working game of tic tac toe
# by combining your code with any user interface,
# whether web or command line.

# Acceptance Criteria:
#   Allows Players to switch Turns
#   Checks if a player has won
#   Checks if Board is full
#   Checks if a player has Won:
#     Checks Diagonals
#     Checks Horizontals
#     Checks Verticals
require 'game'

describe Game do
  before(:each) do
    @game = Game.new
    @empty_layout = {
      'A' => { "1": '',  "2": '', "3": '' },
      'B' => { "1": '',  "2": '', "3": '' },
      'C' => { "1": '',  "2": '', "3": '' }
    }
  end
  # let(:all_a_x) { double('Board', layout: @all_a_x) }
  # let(:all_a_o) { double('Board', layout: @all_a_o) }
  # let(:all_b_x) { double('Board', layout: @all_b_x) }
  # let(:all_b_o) { double('Board', layout: @all_b_o) }
  # let(:all_c_x) { double('Board', layout: @all_c_x) }
  # let(:empty_board)   { double('Board', layout: @empty_layout) }
  
  context '#check_rows' do
    it 'returns X if A1 - A3 is taken by X' do
      all_a_x = {
        'A' => { "1": 'X',  "2": 'X', "3": 'X' },
        'B' => { "1":  '',  "2": 'O', "3": '' },
        'C' => { "1": 'O',  "2": '',  "3": 'O' }
      }
      expect(@game.check_rows(all_a_x, "X")).to eq("X")
    end

    it 'returns O if A1 - A3 is taken by O' do
      all_a_o = {
        'A' => { "1": 'O',  "2": 'O', "3": 'O' },
        'B' => { "1":  '',  "2": 'X', "3": '' },
        'C' => { "1": 'X',  "2": '',  "3": 'X' }
      }
      expect(@game.check_rows(all_a_o, "O")).to eq("O")
    end

    it 'returns X if B1 - B3 is taken by X' do
      all_b_x = {
        'A' => { "1": '',  "2": 'O', "3":  'O' },
        'B' => { "1": 'X',  "2": 'X', "3": 'X' },
        'C' => { "1": 'O',  "2": '',  "3": 'O' }
      }
      expect(@game.check_rows(all_b_x, "X")).to eq("X")
    end

    it 'returns O if B1 - B3 is taken by O' do
      all_b_o = {
        'A' => { "1": '',  "2": 'X', "3":  'O' },
        'B' => { "1": 'O',  "2": 'O', "3": 'O' },
        'C' => { "1": 'X',  "2": '',  "3": 'X' }
      }
      expect(@game.check_rows(all_b_o, "O")).to eq("O")
    end

    it 'returns X if C1 - C3 is taken by X' do
      all_c_x = {
        'A' => { "1": '',  "2": 'O', "3":  '' },
        'B' => { "1": 'O',  "2": '',  "3": 'O' },
        'C' => { "1": 'X',  "2": 'X', "3": 'X' }
      }
      expect(@game.check_rows(all_c_x, "X")).to eq("X")
    end

    it 'returns nil if C1 - C3 is not taken by either X or O' do
      expect(@game.check_rows(@empty_layout, "X")).to eq(nil)
      expect(@game.check_rows(@empty_layout, "O")).to eq(nil)
    end
  end

  context "#check_columns" do
    it "returns X if the first column has all X's" do
      layout = {
        'A' => { "1": 'X',  "2": '', "3": '' },
        'B' => { "1": 'X',  "2": '', "3": '' },
        'C' => { "1": 'X',  "2": '', "3": '' }
      }

      expect(@game.check_columns(layout, "X")).to eq("X")
    end

    it "returns O if the first column has all O's" do
      layout = {
        'A' => { "1": 'O',  "2": '', "3": '' },
        'B' => { "1": 'O',  "2": '', "3": '' },
        'C' => { "1": 'O',  "2": '', "3": '' }
      }

      expect(@game.check_columns(layout, "O")).to eq("O")
    end

    it "returns X if the second column has all X's" do
      layout = {
        'A' => { "1": '',  "2": 'X', "3": '' },
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": '',  "2": 'X', "3": '' }
      }

      expect(@game.check_columns(layout, "X")).to eq("X")
    end

    it "returns O if the third column has all O's" do
      layout = {
        'A' => { "1": '',  "2": '', "3": 'O' },
        'B' => { "1": '',  "2": '', "3": 'O' },
        'C' => { "1": '',  "2": '', "3": 'O' }
      }

      expect(@game.check_columns(layout, "O")).to eq("O")
    end

    it "returns nil if none of the columns have all X's or O's" do
      layout = {
        'A' => { "1": 'O',  "2": '', "3": 'X' },
        'B' => { "1": '',  "2": 'X', "3": 'O' },
        'C' => { "1": 'X',  "2": 'O', "3": '' }
      }

      expect(@game.check_columns(layout, "O")).to eq(nil)
      expect(@game.check_columns(layout, "X")).to eq(nil)
      expect(@game.check_columns(@empty_layout, "X")).to eq(nil)
    end
  end

  context "#check_diagonals" do
    it "returns X if all X's on diagonal from bottom left to top right" do
      layout = {
        'A' => { "1": '',  "2": '',  "3": 'X'},
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": 'X', "2": '',  "3": '' }
      }

      expect(@game.check_diagonals(layout, "X")).to eq("X")
    end

    it "returns O if all O's on diagonal from bottom left to top right" do
      layout = {
        'A' => { "1": '',  "2": '',  "3": 'O'},
        'B' => { "1": '',  "2": 'O', "3": '' },
        'C' => { "1": 'O', "2": '',  "3": '' }
      }

      expect(@game.check_diagonals(layout, "O")).to eq("O")
    end

    it "returns X if all X's on diagonal from top left to bottom right" do
      layout = {
        'A' => { "1": 'X', "2": '',  "3": '' },
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": '',  "2": '',  "3":  'X'}
      }

      expect(@game.check_diagonals(layout, "X")).to eq("X")
    end
  end
end


