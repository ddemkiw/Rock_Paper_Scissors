require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  
  enable :sessions
  
  get '/' do
    erb :index
  end

  get '/new_game' do 
    "New Game!"
    erb :new_game
  end

  post '/guess' do
    session[:auto_guess] = auto_guess
    session[:guess] =  params[:rps].to_sym
    
    if session[:guess] == session[:auto_guess]
      redirect '/draw'
    end 

     if (lose[session[:guess].to_sym]) == session[:auto_guess]
      p "I picked:#{session[:guess]} for me to lose, computer should have picked: #{lose[session[:guess].to_sym]}"
      p "computer actually picked #{session[:auto_guess]}"
      redirect '/lose'
    end
    
    if lose[session[:guess].to_sym] != session[:auto_guess]
      p "I picked:#{session[:guess]} for me to lose, computer should have picked: #{lose[session[:guess].to_sym]}"
      p "computer actually picked #{session[:auto_guess]}"
      redirect '/win'
    end 
    

    erb :new_game
  end

  get '/win' do 
    p "The game said I won"
    @computer = session[:auto_guess]
    @guess = session[:guess]
    erb :win
  end 
  
  get '/lose' do 
    p "the game said I lost"
    @computer = session[:auto_guess]
    @guess = session[:guess]
    erb :lose
  end

  get '/draw' do 
    @guess = session[:guess]
    @computer = session[:auto_guess]
    erb :draw
  end

  def lose
    {:rock => :paper, :paper => :scissors, :scissors => :rock}
  end


  def auto_guess
    [:rock, :paper, :scissors].sample
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
