class Game

  attr_reader :player1, :player2, :beats, :picks

  def initialize(player1, player2)
    @picks = []
    @player1 = player1
    @player2 = player2
    @beats = {:rock=>:scissors, :scissors=>:paper, :paper=>:rock}
  end

  def winner
    if same_pick 
      return :draw
    else 
      @beats[@player1.pick] == @player2.pick ? @player1 : @player2
    end

  end

  def picks 
    @picks << @player2.pick
    @picks << @player1.pick
  end 

  def same_pick
    @player1.pick == @player2.pick 
  end

 

end 