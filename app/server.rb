require 'sinatra/base'
require './app/helpers'

class RPS < Sinatra::Base
  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }

  enable :sessions

  @@waiting_players = []
  @@next_game_players = []
  

  get '/' do
    session[:games] = []
    erb :index
  end

  get '/one_player' do 
    erb :select_one_player
  end

  post '/one_player_select' do 
    new_one_player_game
    @game.player1.picks(params[:rps].to_sym)
    @winner == :draw ? session[:games] << "Draw" : session[:games]<< @winner.name 
    scores(session[:games])
    erb :result
  end 

  get '/two_player' do
    erb :two_player
  end  

  post '/two_player' do
    session[:name] = params[:name]
    redirect '/two_player_select'
  end 

  get  '/two_player_select' do
    erb :select_two_player
  end 

  post '/two_player_select' do
    session[:player] = Player.new(session[:name])
    session[:player].picks(params[:rps].to_sym) 
    @@waiting_players << session[:player]
    redirect 'waiting'
  end

  get '/waiting' do
    if @@waiting_players.length == 2
      redirect '/two_player_result'
    else
       erb :waiting
     end
  end


  get '/two_player_result' do
    @@next_game_players << session[:player]
    @player = session[:player]
    new_two_player_game(@@waiting_players[0], @@waiting_players[1])
    @winner == :draw ? session[:games] << "Draw" : session[:games]<< @winner.name 
    scores(session[:games])
    erb :result_two_player
  end

  get '/reset_game' do
    if @@next_game_players.length % 2 == 0
      if @@waiting_players.length == 2
          @@waiting_players.clear
        end 
      redirect '/two_player_select'
    else
      erb :waiting
    end
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
