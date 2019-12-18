# frozen_string_literal: true

class Board
  def initialize
    @board = {
      'A' => { "1": '',  "2": '', "3": '' },
      'B' => { "1": '',  "2": '', "3": '' },
      'C' => { "1": '',  "2": '', "3": '' }
    }
  end

  def add(piece, position)
    row = position[0]
    column = position[1].to_sym
    if "ABC".include?(position[0]) || "123".include?(position[1])
      if @board[row][column] == ''
        @board[row][column] = piece
      else
        return "Cannot add piece to a spot that has been taken"
      end
    else
      return "Cannot add piece to a spot outside the board"
    end
    [@board['A'], @board['B'], @board['C']]
  end
end
