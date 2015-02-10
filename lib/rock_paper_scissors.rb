require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
  set :views, Proc.new{ File.join(root, "views") }
  set :public_dir, Proc.new{ File.join(root, "public") }

@@games = Hash.new
@@waiting_player = []

  enable :sessions

  get '/' do
    erb :index
  end

  get '/one_player' do
    session[:player] = Player.new("You")
    session[:computer] = Player.new("Computer")
    redirect '/one_player_pick'
  end

  get '/two_player' do
    session[:num_players] = 2
    session[:player] = Player.new(session[:name])
    if @@waiting_player.empty?
      @@games[session[:id]] = Game.new
      @@waiting_player << session[:id]
    else
      @@games[session[:id]] = @@games[@@waiting_player.pop]
    end
    
    erb :two_player
  end

  post '/two_player' do
    session[:player].name = params[:name]
    p session.inspect
    session[:guess] = params[:rps]
      if session[:player].name.nil? || session[:player].name.empty?
        redirect '/two_player'
      else
        redirect '/two_player_pick'
      end
  end


  get '/one_player_pick' do
    @@games[session[:id]] = Game.new
    game = @@games[session[:id]]
    game.add_player(session[:player])
    game.add_player(session[:computer])
    erb :pick
  end

  get '/two_player_pick' do 
    @@games[session[:id]] = Game.new
    game = @@games[session[:id]]
    game.add_player(session[:player])
    erb :pick
  end

  # post '/result' do
  #   game = @@games[session[:id]]
  #   if session[:num_players] == 2
  #     guess =  params[:rps]
  #       if game.player1.pick 
  #         session[:pick] = game.player2.picks(guess.to_sym)
  #       else
  #         session[:pick] = game.player1.picks(guess.to_sym)
  #       end
  #     redirect '/waiting'
  #   else
  #     game.player1.picks(params[:rps].to_sym)
  #     game.player2.picks(game.player2.auto_picks)
  #       if game.winner
  #         game.winner.add_point
  #         @winner = game.winner
  #       end
  #     @name = session[:player].name
  #     @score = session[:player].score
  #     p @score
  #     erb :result
  #   end
  end



  get '/two_player_result' do
    game = @@games[session[:id]]
    @name = session[:player].name
    @score = session[:player].score
    if game.winner
      game.winner.add_point
      @winner = game.winner
    end
      erb :result  
  end

   get '/waiting' do
     @@games[session[:id]].add_player(session[:player])
      if game.player2
        redirect '/two_player_result'
      else
        erb :waiting
      end
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end
