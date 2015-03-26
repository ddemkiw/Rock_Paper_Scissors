require 'sinatra/base'
require 'active_support/inflector'
require './app/helpers'

class RPS < Sinatra::Base
  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }

  enable :sessions

  @@waiting_players = []


  get '/' do
    session[:game_number] =0
    session[:games] = []
    erb :index
  end

  get '/one_player' do 
    session[:game_number] += 1

    erb :select_one_player
  end

  post '/one_player_select' do 
    new_one_player_game
    @game.player1.picks(params[:rps].to_sym)
    @winner = @game.winner
    @winner == :draw ? session[:games] << "Draw" : session[:games]<< @winner.name 
    scores(session[:games])

    erb :result
  end 

  get '/two_player' do
    erb :two_player
  end  

  post '/two_player' do
    @@waiting_players << params[:name]
    session[:name] = params[:name]
     if @@waiting_players.length == 2 
        redirect '/two_player_select'
      else
        redirect 'waiting'
      end 
  end 

  get  '/two_player_select' do
    @player1 = Player.new(@@waiting_players[0])
    @player2 = Player.new(@@waiting_players[1]) 
    
    erb :select_two_player
  end 

  post '/two_player_select' do
    @player1 = Player.new(@@waiting_players[0])
    @player2 = Player.new(@@waiting_players[1]) 
    two_player_picks

    if both_players_picked?
      @winner = @game.winner
      @winner == :draw ? session[:games] << "Draw" : session[:games]<< @winner.name 
      scores(session[:games])
      erb :result
    else
      erb :waiting
    end
  end

  get '/waiting' do
    if @@waiting_players.length == 2 
        redirect '/two_player_select'
      else
        erb :waiting
      end 
  end 


  # start the server if ruby file executed directly
  run! if app_file == $0
end
