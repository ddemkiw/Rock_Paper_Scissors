require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }

  GAME = Game.new

  enable :sessions

  get '/' do
    erb :index
  end

  get '/two_player' do
    session[:num_players] = 2
    erb :two_player
  end

  post '/two_player' do
    name = params[:name]
    session[:guess] = params[:rps]
      if name.nil? || name.empty?
        redirect '/two_player'
      else
        GAME.add_player(Player.new(name))
        redirect '/waiting'
      end
  end

  get '/waiting' do 
    if GAME.player2
      erb :pick
    else
      erb :waiting
    end
  end

   get '/waiting2' do 
    if GAME.player2.pick
      redirect '/two_player_result'
    else
      erb :waiting
    end
  end

  get '/pick' do
    GAME.player1.clear
    GAME.player2.clear
    GAME.add_player(Player.new("You"))
    GAME.add_player(Player.new("Computer"))
    erb :pick
  end


  post '/result' do
    if session[:num_players] == 2
      guess =  params[:rps]
        if GAME.player1.pick 
          session[:player2] = GAME.player2.picks(guess.to_sym)
        else
          session[:player1] = GAME.player1.picks(guess.to_sym)
        end
      redirect '/waiting2'
    else
      guess =  params[:rps]
      @pick = GAME.player1.picks(guess.to_sym)
      @auto_pick = GAME.player2.picks(GAME.player2.auto_picks)
      @winner = GAME.winner
      p "Computer picks #{GAME.player2.pick}"
      p GAME.player1.pick 
      erb :result
    end
  end

  get '/two_player_result' do
    @winner = GAME.winner
    p session.inspect
    session[:player1] = @player1_pick
    session[:player2] = @player2_pick
    p "player1 picked #{GAME.player1.pick}"
    p "player2 picked #{GAME.player2.pick}"
    erb :result
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
