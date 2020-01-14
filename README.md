# tic-tac-toe
An OOP TDD model for the business logic of tic-tac-toe

## Implementation
This challenge was completed through the use of OOP principles and the TDD methodology.

I started with the player class, as the most simple part of the program. The player has a name, and a piece (X or O)

```ruby
Class Player
  def initialize(name, peice)
    @name = name
    @piece = piece
  end
end
```

The next step was to implement the board class, as the next simplest part of the program.
I decided to use a hash containing three hashes to map out a 3 x 3 board

```ruby
@layout = {
  'A' => { "1": '',  "2": '', "3": '' },
  'B' => { "1": '',  "2": '', "3": '' },
  'C' => { "1": '',  "2": '', "3": '' }
}
```

This means that you can place a piece on the board with the following syntax:

```ruby
@layout["A"]["1"] = "X"
```

A challenge I faced was that having to convert column values to symbols in my 'add' method
which takes in a piece (X or O) and a postion in the accepted formats of A1 or ["A", "1"]:

```ruby
def add(piece, position)
  row = position[0]
  column = position[1].to_sym
  @layout[row][column] = piece
  [@layout['A'], @layout['B'], @layout['C']]
end
```

After this I added some methods to Validate the input. A move must land on the 3x3 grid and a piece cannot
be placed where a piece already exists. A piece must be either a X or a O:

```ruby
def validate_move(piece, position)
  return (  
    "ABC".include?(position[0]) &&
    "123".include?(position[1]) && 
    "XO".include?(piece)        && 
    @layout[position[0]][position[1].to_sym] == ''
    )
end
```

Below is the add function with input validation included:

```ruby
def add(piece, position)
  if validate_move(piece, position)
    row = position[0]
    column = position[1]
    @layout[row][column] = piece
    [@layout['A'], @layout['B'], @layout['C']]
  else 
    return "Invalid Move"
  end
end
```

Lastly I added a method to check if the board is full. I used the values.all? method to check if each
value in each hash was not equal to " ":

```ruby
def full?
  a = @layout['A'].values.all? {|x| x != ''}
  b = @layout['B'].values.all? {|x| x != ''}
  c = @layout['C'].values.all? {|x| x != ''}
  return a && b && c
end
```
