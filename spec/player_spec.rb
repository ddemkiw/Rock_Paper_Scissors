require './app/lib/player.rb'
require './app/lib/game.rb'

describe 'playing game' do

  let(:player1) {Player.new('Sam')}
  
  it 'can pick rock, paper or scissors' do
    player1.picks(:scissors)

    expect(player1.pick).to eq(:scissors) 
  end


end