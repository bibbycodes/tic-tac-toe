# frozen_string_literal: true

class Board
  attr_reader :layout
  def initialize
    @layout = {
      'A' => { "1": '',  "2": '', "3": '' },
      'B' => { "1": '',  "2": '', "3": '' },
      'C' => { "1": '',  "2": '', "3": '' }
    }
  end

  def add(piece, position)
    if validate_move(piece, position)
      row = position[0]
      column = position[1].to_sym
      @layout[row][column] = piece
      [@layout['A'], @layout['B'], @layout['C']]
    else
      'Invalid Move'
    end
  end

  def full?
    a = @layout['A'].values.all? { |x| x != '' }
    b = @layout['B'].values.all? { |x| x != '' }
    c = @layout['C'].values.all? { |x| x != '' }
    a && b && c
  end

  private

  def validate_move(piece, position)
    (
      'ABC'.include?(position[0]) &&
      '123'.include?(position[1]) &&
      'XO'.include?(piece)        &&
      @layout[position[0]][position[1].to_sym] == ''
    )
  end
end
