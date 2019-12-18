# frozen_string_literal: true

class Board
  def initialize
    @board = {
      "A" => { "1": '',  "2": '', "3": '' },
      "B" => { "1": '',  "2": '', "3": '' },
      "C" => { "1": '',  "2": '', "3": '' }
    }
  end

  def add(piece, position)
    row = position[0]
    column = position[1].to_sym
    @board[row][column] = piece
    [@board["A"], @board["B"], @board["C"]]
  end
end