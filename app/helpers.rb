require './app/lib/game'
require './app/lib/autoPlayer'
require './app/lib/Player'
require './app/server'

def new_one_player_game
  @player1 = Player.new('You')
  @player2 = AutoPlayer.new
  @game = Game.new(@player1, @player2)
  @winner = @game.winner
end

def pluralizer(winner, text)
  return "#{text}s" if winner != "You"
  text
end

def scores(games)
  @score = games.inject(Hash.new(0)) { |total, item| total[item] += 1 ;total}
end 

def new_two_player_game(player1, player2)
  @game || @game = Game.new(player1, player2)
  @winner = @game.winner
end 

def remove_player_from_array(array)
  array.pop
end 

def opponent_pick(player)
  if @game.player1.pick == player.pick
    @game.player2.pick
  else 
    @game.player1.pick
  end 
end 

def opponent_name(player)
  if @game.player1.name == player.name
    @game.player2.name
  else 
    @game.player1.name
  end
end 





