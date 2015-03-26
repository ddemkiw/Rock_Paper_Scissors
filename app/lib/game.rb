class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @beats = {:rock=>:scissors, :scissors=>:paper, :paper=>:rock}
  end

  def winner
    if @player1.pick != @player2.pick
      @beats[@player1.pick] == @player2.pick ? @player1 : @player2
    else
      :draw
    end 
  end 

end 