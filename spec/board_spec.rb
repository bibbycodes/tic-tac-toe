# frozen_string_literal: true

# Acceptance Criteria:
#   is a 3 x 3 board
#   can tell when the board is full
#   Prevents players from placing a piece in the same spot more than once
#   Players can add a piece to the board

require 'board'

describe Board do
  context 'adding a piece to the board' do
    let(:player_x) { double('Player', name: 'Robert', piece: 'X') }
    let(:player_o) { double('Player', name: 'Joseph', piece: 'O') }
    let(:invalid_player) { double('Player', name: 'Thomas', piece: 'D') }
    before(:each) do
      @board = Board.new
    end
    it 'can add an X to the board at A 1' do
      expect(@board.add(player_x, 'A1')).to eq([
                                                 { "1": 'X',  "2": ' ', "3": ' ' },
                                                 { "1": ' ',  "2": ' ', "3": ' ' },
                                                 { "1": ' ',  "2": ' ', "3": ' ' }
                                               ])
    end

    it 'can add an O to the board at A 1' do
      expect(@board.add(player_o, 'A1')).to eq([
                                                 { "1": 'O',  "2": ' ', "3": ' ' },
                                                 { "1": ' ',  "2": ' ', "3": ' ' },
                                                 { "1": ' ',  "2": ' ', "3": ' ' }
                                               ])
    end

    it 'can add an X to the board at A 2' do
      expect(@board.add(player_x, 'A2')).to eq([
                                                 { "1": ' ', "2": 'X',  "3": ' ' },
                                                 { "1": ' ', "2": ' ',  "3": ' ' },
                                                 { "1": ' ', "2": ' ',  "3": ' ' }
                                               ])
    end

    it 'can add an O to the board at B 1' do
      expect(@board.add(player_o, 'B1')).to eq([
                                                 { "1": ' ', "2": ' ', "3": ' ' },
                                                 { "1": 'O', "2": ' ', "3": ' ' },
                                                 { "1": ' ', "2": ' ', "3": ' ' }
                                               ])
    end

    it 'can add an X to the board at C 2' do
      expect(@board.add(player_x, 'C2')).to eq([
                                                 { "1": ' ', "2": ' ', "3": ' ' },
                                                 { "1": ' ', "2": ' ', "3": ' ' },
                                                 { "1": ' ', "2": 'X', "3": ' ' }
                                               ])
    end

    it 'can add an O to the board at C 3 and then an X at A 1' do
      @board.add(player_x, 'A1')
      expect(@board.add(player_o, 'C3')).to eq([
                                                 { "1": 'X',  "2": ' ',  "3": ' ' },
                                                 { "1": ' ',  "2": ' ',  "3": ' ' },
                                                 { "1": ' ',  "2": ' ',  "3": 'O' }
                                               ])
    end

    context 'validation' do
      it 'cannot add a piece to a spot that has been taken' do
        @board.add(player_x, 'A1')
        expect(@board.add(player_x, 'A1')).to eq('Invalid Move')
      end

      it 'cannot add a piece other than X or O' do
        expect(@board.add(invalid_player, 'A1')).to eq('Invalid Move')
      end

      it 'cannot add a piece to a spot outside the board' do
        expect(@board.add(player_x, 'D4')).to eq('Invalid Move')
      end
    end

    context '#full?' do
      it 'returns true if the board is full' do
        (1..3).each do |i|
          @board.add(player_x, "A#{i}")
          @board.add(player_x, "B#{i}")
          @board.add(player_x, "C#{i}")
        end
        expect(@board.full?).to be(true)
      end

      it 'returns false if the board is not full' do
        (1..3).each do |i|
          @board.add(player_x, "A#{i}")
        end
        expect(@board.full?).to be(false)
      end
    end
  end
end
