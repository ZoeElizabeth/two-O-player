
require 'pry'
require 'colored2'
require './game'
require './players'


player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

Game.get_players(player1)
Game.get_players(player2)

game = Game.new()

game.round

