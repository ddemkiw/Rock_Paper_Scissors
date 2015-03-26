require './app/lib/player.rb'
require './app/lib/game.rb'
require './app/lib/autoPlayer.rb'

describe 'playing game' do

  let(:player1) {Player.new('Sam')}
  let(:player2) {Player.new('Sandi')}
  let(:game) {Game.new(player1, player2)}
  let(:game) {Game.new(player1, player2)}
  let(:game) {Game.new(player1, player2)}
  let(:game) {Game.new(player1, player2)}

  context 'against a real player' do 

    it 'can have a draw' do
      player1.picks(:scissors)
      player2.picks(:scissors)

      expect(game.winner).to eq(:draw) 
    end

    it 'knows scissors beats paper' do
      player1.picks(:scissors)
      player2.picks(:paper)

      expect(game.winner).to eq(player1) 
    end 

    it 'knows paper beats rock' do 
      player1.picks(:paper)
      player2.picks(:rock)

      expect(game.winner).to eq(player1) 
    end 

    it 'knows rock beats scissors' do
      player1.picks(:rock)
      player2.picks(:scissors)

      expect(game.winner).to eq(player1)
    end
  end 

  context 'against a computer' do 

    let(:computer) {AutoPlayer.new}
    let(:game2) {Game.new({:player1=>player1, :player2=>computer})}


    it 'should treat computer like any other player' do 
      player1.picks(:scissors)
      computer.picks

      expect(game.winner).not_to be_nil
    end 
  
  end 

end