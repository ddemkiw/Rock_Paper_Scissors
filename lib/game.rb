class Game

  attr_accessor :player1, :player2

  PAIRS = {
    rock:     { beats: :scissors },
    paper:    { beats: :rock },
    scissors: { beats: :paper }
  }.freeze

  def initialize
    player1, player2 = nil, nil
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player 
  end

  def winner
    return nil if same_pick?

    if PAIRS[player1.pick][:beats] == player2.pick
      player1
    else
      player2
    end
  end

  private

  def same_pick?
    self.player1.pick == self.player2.pick
  end

end
