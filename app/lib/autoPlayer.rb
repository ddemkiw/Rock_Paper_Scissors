class AutoPlayer

  attr_reader :pick, :name

  def initialize()
    @choices = [:rock, :paper, :scissors]
    @name = 'Computer'
  end

  def picks
    @pick = @choices.sample
  end 
end 