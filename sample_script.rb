# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/display'

board = Board.new
rob = Player.new('Robert', 'X')
joe = Player.new('Joseph', 'O')
game = Game.new(board, rob, joe)
display = Display.new

puts "Welcome to Tic Tac Toe!"
puts "Enter your move in the format 'A1'"

until game.winner
  puts "#{game.current_player.name} Enter a move \n"
  move = gets
  if game.board.add(game.current_player, move) == 'Invalid Move'
    puts("#{game.current_player.name}, please enter A Valid Move ")
    next
  end
  view = display.show(game.board)
  view.each do |line|
    puts line
  end
  [rob, joe].each do |player|
    game.winner?(player)
  end
  game.switch_turns
end
puts("#{game.winner} won!")

