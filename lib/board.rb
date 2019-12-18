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
    if validate_move(piece, position)
      row = position[0]
      column = position[1].to_sym
      @board[row][column] = piece
      [@board['A'], @board['B'], @board['C']]
    else 
      return "Invalid Move"
    end
  end

  def full?
    a = @board['A'].values.all? {|x| x != ''}
    b = @board['B'].values.all? {|x| x != ''}
    c = @board['C'].values.all? {|x| x != ''}
    return a && b && c
  end

  private

  def validate_move(piece, position)
    return (  "ABC".include?(position[0]) &&
              "123".include?(position[1]) && 
              "XO".include?(piece) && 
              @board[position[0]][position[1].to_sym] == ''
            )
  end
end
