class Player

  attr_accessor :pick, :name, :score

  def initialize(name)
    @score = 0
    @name = name
  end

  def picks(pick)
    @pick = pick
  end

  def auto_picks
    [:rock, :paper, :scissors].sample
  end

  def add_point
    @score +=1    
  end


end