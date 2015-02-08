class Player

  attr_reader :pick, :name

  def initialize(name)
    @name = name
  end

  def picks(pick)
    @pick = pick
  end

  def auto_picks
    [:rock, :paper, :scissors].sample
  end

  def clear 
    pick = nil 
  end

end