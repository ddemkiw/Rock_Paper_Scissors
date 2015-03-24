class Game

  def initialize(opts={})
    @player1 = opts[:player1]
    @player2 = opts[:player2]
    @beats = {:rock=>:scissors, :scissors=>:paper, :paper=>:rock}
  end

  def winner
    if @player1.pick != @player2.pick
      @beats[@player1.pick] == @player2.pick ? :player1 : :player2
    else
      :draw
    end 
  end 
end 