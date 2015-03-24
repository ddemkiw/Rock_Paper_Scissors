class Player

  attr_reader :pick

  def initialize(name)
    @name = name
  end 

  def picks(pick)
    @pick = pick
  end

end