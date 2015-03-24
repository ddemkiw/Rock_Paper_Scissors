require 'sinatra/base'

class RPS < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/one_player' do 
    erb :select
  end

  get '/two_player' do 
  end  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
