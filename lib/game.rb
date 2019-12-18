class Game
  def check_rows(layout)
    if layout['A'].values.all? {|x| x == 'X'} || layout['B'].values.all? {|x| x == 'X'} || layout['C'].values.all? {|x| x == 'X'} 
      return "X"
    elsif layout['A'].values.all? {|x| x == 'O'} || layout['B'].values.all? {|x| x == 'O'} || layout['C'].values.all? {|x| x == 'O'} 
      return "O"
    else
      return nil
    end
  end
end