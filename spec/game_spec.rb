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
    # game = Game.new
    @empty_layout = {
      'A' => { "1": '',  "2": '', "3": '' },
      'B' => { "1": '',  "2": '', "3": '' },
      'C' => { "1": '',  "2": '', "3": '' }
    }

    @stalemate_layout = {
      'A' => { "1": 'X',  "2": 'O', "3": 'X' },
      'B' => { "1": '0',  "2": 'X', "3": 'O' },
      'C' => { "1": 'O',  "2": 'X', "3": 'O' }
    }

    @all_a_x = {
      'A' => { "1": 'X',  "2": 'X', "3": 'X' },
      'B' => { "1": '', "2": 'O', "3": '' },
      'C' => { "1": 'O',  "2": '',  "3": 'O' }
    }

    @all_a_o = {
      'A' => { "1": 'O',  "2": 'O', "3": 'O' },
      'B' => { "1": '', "2": 'X', "3": '' },
      'C' => { "1": 'X',  "2": '',  "3": 'X' }
    }

    @all_b_x = {
      'A' => { "1": '', "2": 'O', "3": 'O' },
      'B' => { "1": 'X',  "2": 'X', "3": 'X' },
      'C' => { "1": 'O',  "2": '',  "3": 'O' }
    }

    @all_b_o = {
      'A' => { "1": '', "2": 'X', "3": 'O' },
      'B' => { "1": 'O',  "2": 'O', "3": 'O' },
      'C' => { "1": 'X',  "2": '',  "3": 'X' }
    }

    @all_col_1_o = {
      'A' => { "1": 'O',  "2": '', "3": '' },
      'B' => { "1": 'O',  "2": '', "3": '' },
      'C' => { "1": 'O',  "2": '', "3": '' }
    }

    @all_c_x = {
      'A' => { "1": '', "2": 'O', "3":  '' },
      'B' => { "1": 'O',  "2": '',  "3": 'O' },
      'C' => { "1": 'X',  "2": 'X', "3": 'X' }
    }
  end

  let(:player_x) { double('Player', name: 'Robert', piece: 'X') }
  let(:player_o) { double('Player', name: 'Joseph', piece: 'O') }
  let(:all_ao) { double('Board', layout: @all_a_o) }
  let(:all_bx) { double('Board', layout: @all_b_x) }
  let(:all_bo) { double('Board', layout: @all_b_o) }
  let(:all_cx) { double('Board', layout: @all_c_x) }
  let(:empty_board) { double('Board', layout: @empty_layout) }
  let(:stalemate_board) { double('Board', layout: @stalemate_layout) }
  let(:board_ax) { double('Board', layout: @all_a_x) }
  let(:board_bo) { double('Board', layout: @all_b_o) }

  context '#check_rows' do
    it 'returns the players name if A1 - A3 is taken by X' do
      game = Game.new(board_ax)
      expect(game.check_rows(player_x)).to eq('Robert')
    end

    it 'returns The Players name if A1 - A3 is taken by O' do
      game = Game.new(all_ao)
      expect(game.check_rows(player_o)).to eq('Joseph')
    end

    it 'returns the players name if B1 - B3 is taken by X' do
      game = Game.new(all_bx)
      expect(game.check_rows(player_x)).to eq('Robert')
    end

    it 'returns O if B1 - B3 is taken by O' do
      game = Game.new(all_bo)
      expect(game.check_rows(player_o)).to eq('Joseph')
    end

    it 'returns the players name if C1 - C3 is taken by X' do
      game = Game.new(all_cx)
      expect(game.check_rows(player_x)).to eq('Robert')
    end

    it 'returns nil if C1 - C3 is not taken by either X or O' do
      game_1 = Game.new(empty_board)
      game_2 = Game.new(stalemate_board)
      expect(game_1.check_rows(player_x)).to eq(nil)
      expect(game_2.check_rows(player_o)).to eq(nil)
      expect(game_1.check_rows(player_o)).to eq(nil)
      expect(game_2.check_rows(player_x)).to eq(nil)
    end
  end

  context '#check_columns' do
    it "returns the players name if the first column has all X's" do
      layout = {
        'A' => { "1": 'X',  "2": '', "3": '' },
        'B' => { "1": 'X',  "2": '', "3": '' },
        'C' => { "1": 'X',  "2": '', "3": '' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_columns(player_x)).to eq('Robert')
    end

    it "returns O if the first column has all O's" do
      board = double('Board', layout: @all_col_1_o)
      game = Game.new(board)
      expect(game.check_columns(player_o)).to eq('Joseph')
    end

    it "returns the players name if the second column has all X's" do
      layout = {
        'A' => { "1": '',  "2": 'X', "3": '' },
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": '',  "2": 'X', "3": '' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_columns(player_x)).to eq('Robert')
    end

    it "returns O if the third column has all O's" do
      layout = {
        'A' => { "1": '',  "2": '', "3": 'O' },
        'B' => { "1": '',  "2": '', "3": 'O' },
        'C' => { "1": '',  "2": '', "3": 'O' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_columns(player_o)).to eq('Joseph')
    end

    it "returns nil if none of the columns have all X's or O's" do
      layout = {
        'A' => { "1": 'O', "2": '', "3": 'X' },
        'B' => { "1": '', "2": 'X', "3": 'O' },
        'C' => { "1": 'X', "2": 'O', "3": '' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_columns(player_o)).to eq(nil)
      expect(game.check_columns(player_x)).to eq(nil)
      expect(game.check_columns(player_x)).to eq(nil)
    end
  end

  context '#check_diagonals' do
    it "returns the players name if all X's on diagonal from bottom left to top right" do
      layout = {
        'A' => { "1": '',  "2": '',  "3": 'X' },
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": 'X', "2": '',  "3": '' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_diagonals(player_x)).to eq('Robert')
    end

    it "returns O if all O's on diagonal from bottom left to top right" do
      layout = {
        'A' => { "1": '',  "2": '',  "3": 'O' },
        'B' => { "1": '',  "2": 'O', "3": '' },
        'C' => { "1": 'O', "2": '',  "3": '' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_diagonals(player_o)).to eq('Joseph')
    end

    it "returns the players name if all X's on diagonal from top left to bottom right" do
      layout = {
        'A' => { "1": 'X', "2": '',  "3": '' },
        'B' => { "1": '',  "2": 'X', "3": '' },
        'C' => { "1": '',  "2": '',  "3":  'X' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_diagonals(player_x)).to eq('Robert')
    end

    it "returns O if all O's on diagonal from top left to bottom right" do
      layout = {
        'A' => { "1": 'O', "2": '',  "3": '' },
        'B' => { "1": '',  "2": 'O', "3": '' },
        'C' => { "1": '',  "2": '',  "3": 'O' }
      }
      board = double('Board', layout: layout)
      game = Game.new(board)
      expect(game.check_diagonals(player_o)).to eq('Joseph')
    end

    it "returns nil if niether of the diagonals have all X's or O's" do
      game = Game.new(empty_board)
      expect(game.check_diagonals(player_o)).to eq(nil)
      expect(game.check_diagonals(player_x)).to eq(nil)
    end
  end

  context '#winner?' do
    it 'returns the players name when O is the winner' do
      game = Game.new(board_bo)
      expect(game.winner?(player_o)).to eq("Joseph")
      expect(game.winner?(player_x)).to eq(nil)
    end

    it 'returns nil if there is no winner' do
      game_1 = Game.new(empty_board)
      game_2 = Game.new(stalemate_board)
      expect(game_1.winner?(player_o)).to eq(nil)
      expect(game_2.winner?(player_o)).to eq(nil)
    end
  end

  context '#over?' do
    it 'returns true if the game is over after a player has won' do
      game = Game.new(board_ax)
      game.winner?(player_x)
      allow(board_ax).to receive(:full?).and_return(false)
      expect(game.over?).to eq(true)
    end

    it 'returns true if the game is over with a full board' do
      game = Game.new(board_ax)
      allow(board_ax).to receive(:full?).and_return(true)
      expect(game.over?).to eq(true)
    end
  end
end
