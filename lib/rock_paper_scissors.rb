require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/new_game' do 
    "New Game!"
    erb :new_game
  end

  post '/rock' do
    p params[:rps]
    erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
