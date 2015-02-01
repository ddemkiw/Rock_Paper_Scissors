require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  set :views, Proc.new{ File.join(root, "views") }
  set :public, Proc.new{ File.join(root, "public") }

  game = Game.new

  enable :sessions

  get '/' do
    erb :index
  end

  get '/one_player' do
    erb :one_player
  end

  post '/guess' do
   
  end

  get '/draw' do

  end

  get '/win' do

  end

  get '/lose' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
