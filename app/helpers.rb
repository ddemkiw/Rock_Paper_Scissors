require './app/lib/game'
require './app/lib/autoPlayer'
require './app/lib/Player'
require './app/server'

def new_one_player_game
  @player1 = Player.new('You')
  @player2 = AutoPlayer.new
  @game = Game.new(@player1, @player2)
  @game.player2.picks
end

def pluralizer(winner, text)
  return text.pluralize if winner != "You"
  text
end

def scores(games)
  @score = games.inject(Hash.new(0)) { |total, item| total[item] += 1 ;total}
end 

def one_players_picked?
  @game.player1.pick.nil? || @game.player2.pick.nil
end 

def new_two_player_game(player1, player2)
  @game || @game = Game.new(player1, player2)
end 

def remove_player_from_array(array)
  array.pop
end 



