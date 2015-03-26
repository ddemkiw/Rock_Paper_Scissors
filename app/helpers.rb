require './app/lib/game'
require './app/lib/autoPlayer'
require './app/lib/Player'

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

def both_players_picked?
  @game.player1.pick && @game.player2.pick 
end 

def two_player_picks
  @game = Game.new(@player1, @player2)
  if @game.player1.name == session[:name]
    @game.player1.picks(params[:rps])
  else
    @game.player2.picks(params[:rps])
  end
end 