# frozen_string_literal: true

class Game
  attr_accessor :board
  attr_reader :winner
  def initialize(board)
    @board = board
    @winner = nil
  end

  def winner?(player)
    col = check_columns(player) == player.name
    row = check_rows(player) == player.name
    diag = check_diagonals(player) == player.name
    @winner = player.name if col || row || diag
  end

  def check_rows(player)
    layout = @board.layout
    piece = player.piece
    row_a = layout['A'].values.all? { |x| x == piece }
    row_b = layout['B'].values.all? { |x| x == piece }
    row_c = layout['C'].values.all? { |x| x == piece }
    return player.name if row_a || row_b || row_c
  end

  def check_columns(player)
    layout = @board.layout
    piece = player.piece
    col_1 = layout['A'][:"1"] == piece && layout['B'][:"1"] == piece && layout['C'][:"1"] == piece
    col_2 = layout['A'][:"2"] == piece && layout['B'][:"2"] == piece && layout['C'][:"2"] == piece
    col_3 = layout['A'][:"3"] == piece && layout['B'][:"3"] == piece && layout['C'][:"3"] == piece
    return player.name if col_1 || col_2 || col_3
  end

  def check_diagonals(player)
    layout = @board.layout
    piece = player.piece
    diag_1 = layout['C'][:"1"] == piece && layout['B'][:"2"] == piece && layout['A'][:"3"] == piece
    diag_2 = layout['A'][:"1"] == piece && layout['B'][:"2"] == piece && layout['C'][:"3"] == piece
    return player.name if diag_1 || diag_2
  end

  def over?()
    @board.full? || @winner ? true : false
  end
end
