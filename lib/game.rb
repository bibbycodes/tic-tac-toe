# frozen_string_literal: true

class Game
  attr_accessor :board
  attr_reader :winner, :current_player
  def initialize(board, player1, player2)
    @board = board
    @winner = nil
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def winner?(player)
    col_win = check_columns(player) == player.name
    row_win = check_rows(player) == player.name
    diag_win = check_diagonals(player) == player.name
    @winner = player.name if col_win || row_win || diag_win
  end

  def check_rows(player)
    layout = @board.layout
    piece = player.piece
    row_a_win = layout['A'].values.all? { |x| x == piece }
    row_b_win = layout['B'].values.all? { |x| x == piece }
    row_c_win = layout['C'].values.all? { |x| x == piece }
    return player.name if row_a_win || row_b_win || row_c_win
  end

  def check_columns(player)
    layout = @board.layout
    piece = player.piece
    col_1_win = layout['A'][:"1"] == piece && layout['B'][:"1"] == piece && layout['C'][:"1"] == piece
    col_2_win = layout['A'][:"2"] == piece && layout['B'][:"2"] == piece && layout['C'][:"2"] == piece
    col_3_win = layout['A'][:"3"] == piece && layout['B'][:"3"] == piece && layout['C'][:"3"] == piece
    return player.name if col_1_win || col_2_win || col_3_win
  end

  def check_diagonals(player)
    layout = @board.layout
    piece = player.piece
    diaganol_axes_1_win = layout['C'][:"1"] == piece && layout['B'][:"2"] == piece && layout['A'][:"3"] == piece
    diaganol_axes_2_win = layout['A'][:"1"] == piece && layout['B'][:"2"] == piece && layout['C'][:"3"] == piece
    return player.name if diaganol_axes_1_win || diaganol_axes_2_win
  end

  def over?()
    @board.full? || @winner ? true : false
  end

  def switch_turns()
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
end
