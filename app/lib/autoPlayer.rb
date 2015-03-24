class AutoPlayer

  attr_reader :pick

  def initialize()
    @choices = [:rock, :paper, :scissors]
  end

  def picks
    @choices.sample
  end 
end 