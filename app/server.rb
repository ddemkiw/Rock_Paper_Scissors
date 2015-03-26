require 'sinatra/base'
require 'active_support/inflector'
require './app/helpers'

class RPS < Sinatra::Base
  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }

  enable :sessions

  @@waiting_players = []
  @@playing = []
  

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
    @winner = @game.winner
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
    remove_player_from_array(@@playing)
    erb :select_two_player
  end 

  post '/two_player_select' do
    session[:player] = Player.new(params[:name])
    session[:player].picks(params[:rps]) 
    redirect 'waiting2'
  end

  get '/two_player_result' do
    new_two_player_game(@@playing[0], @@playing[1])
    @winner = @game.winner
    puts @game.winner
    @winner == :draw ? session[:games] << "Draw" : session[:games]<< @winner.name 
    scores(session[:games])
    erb :result_two_player
  end

  
  get '/waiting2' do
    @@playing << session[:player]
    
    if @@playing.length == 2
      redirect '/two_player_result'
    else
       erb :waiting
     end 
  end 

  get '/waiting' do
    (@@waiting_players.length == 2) ? (redirect '/two_player_select') : (erb :waiting)
  end 


  # start the server if ruby file executed directly
  run! if app_file == $0
end
