require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/new_game' do 
    "New Game!"
    erb :new_game
  end

  post '/guess' do
    @computer = auto_guess.to_s
    p @computer
    @guess =  params[:rps]
    p @guess
    if @guess == @computer
      redirect '/draw'
    end
    erb :new_game
  end

  get '/draw' do 
    erb :draw
  end


  def auto_guess
    [:rock, :paper, :scissors].sample
  end 


  # start the server if ruby file executed directly
  run! if app_file == $0
end
