require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }



  enable :sessions

  get '/' do
    erb :index
  end

  get '/pick' do
    session[:num_players] = 1
    session[:player1] = Player.new("You")
    session[:computer] = Player.new("Computer")
    erb :pick
  end

  get '/two_players_game' do

  end

  post '/result' do
    guess =  params[:rps]
    player = session[:player1]
    computer = session[:computer]
    game = Game.new(player, computer)
    player.picks(guess.to_sym)
    computer.picks(computer.auto_picks)
    p "Computer picks #{computer.pick}"
    p player.pick 
    @winner = game.winner
    erb :result
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
