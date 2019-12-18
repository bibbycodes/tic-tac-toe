class Game
  def check_rows(layout, piece)
    if layout['A'].values.all? {|x| x == piece} || layout['B'].values.all? {|x| x == piece} || layout['C'].values.all? {|x| x == piece} 
      return piece
    else
      return nil
    end
  end

  def check_columns(layout, piece)
    col_1 = layout["A"][:"1"] == piece && layout["B"][:"1"] == piece && layout["C"][:"1"] == piece
    col_2 = layout["A"][:"2"] == piece && layout["B"][:"2"] == piece && layout["C"][:"2"] == piece
    col_3 = layout["A"][:"3"] == piece && layout["B"][:"3"] == piece && layout["C"][:"3"] == piece
    if col_1 || col_2 || col_3
      return piece
    else
      return nil
    end
  end

  def check_diagonals(layout, piece)
    diag_1 = layout["C"][:"1"] == piece && layout["B"][:"2"] == piece && layout["A"][:"3"] == piece
    diag_2 = layout["A"][:"1"] == piece && layout["B"][:"2"] == piece && layout["C"][:"3"] == piece
    if diag_1 || diag_2
      return piece
    else
      return nil
    end
  end
end