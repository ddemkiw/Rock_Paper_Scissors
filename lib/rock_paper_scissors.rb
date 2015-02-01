require 'sinatra/base'
require './lib/player'
require './lib/game'

class rock_paper_scissors < Sinatra::Base

  set :views, Proc.new{ File.join(root, "..", "views") }
  set :public, Proc.new{ File.join(root, "..", "public") }

  game = Game.new

  enable :sessions

  get '/' do
    'Hello rock_paper_scissors!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
