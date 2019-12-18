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
    if validate_move(piece, position) == true
      row = position[0]
      column = position[1].to_sym
      @board[row][column] = piece
      [@board['A'], @board['B'], @board['C']]
    else 
      return validate_move(piece, position)
    end
  end

  private

  def validate_move(piece, position)
    if ("ABC".include?(position[0]) && "123".include?(position[1]) && "XO".include?(piece))
      if @board[position[0]][position[1].to_sym] == ''
        return true
      end
    end
    return "Invalid Move"
  end
end
