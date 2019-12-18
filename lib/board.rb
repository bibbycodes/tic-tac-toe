class Board
  def initialize
    @A = {"1": "",  "2": "", "3": ""}
    @B = {"1": "",  "2": "", "3": ""}
    @C = {"1": "",  "2": "", "3": ""}
    @board = [@A, @B, @C]
  end

  def add(piece, position)
    if position[0] == "A"
      @A[position[1].to_sym] = piece
    end
    @board
  end
end