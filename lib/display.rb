class Display
  def show(board)
    layout = board.layout
    a1 = layout['A'][:"1"]
    a2 = layout['A'][:"2"]
    a3 = layout['A'][:"3"]
    b1 = layout['B'][:"1"]
    b2 = layout['B'][:"2"]
    b3 = layout['B'][:"3"]
    c1 = layout['C'][:"1"]
    c2 = layout['C'][:"2"]
    c3 = layout['C'][:"3"]

    [
      " #{a1} | #{a2} | #{a3} ",
      '---+---+---',
      " #{b1} | #{b2} | #{b3} ",
      '---+---+---',
      " #{c1} | #{c2} | #{c3} "
    ]
  end
end