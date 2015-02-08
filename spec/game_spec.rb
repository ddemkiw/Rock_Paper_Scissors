require 'rspec'
require_relative '../lib/game'
require_relative '../lib/player'

describe 'Rock-Paper-Scissors' do

  let(:player1) { Player.new 'A' }
  let(:player2) { Player.new 'B' }
  let(:game) { Game.new }

  context 'adding players' do 

    it "can have players added" do 
      game.add_player(player1)
      expect(game.player1).to eq player1
    end

    it "can have a second player added" do
      game.add_player(player1)
      game.add_player(player2)
      expect(game.player2).to eq player2
    end

  end 

  context 'winning and losing' do
    
    before(:each) do
      game.add_player(player1)
      game.add_player(player2)
    end

    describe 'rock' do
      it 'should beat scissors' do
        game.player1.picks :rock and game.player2.picks :scissors
        expect(game.winner).to be(game.player1)
      end

      it 'should lose to paper' do
        player1.picks :rock and player2.picks :paper
        expect(game.winner).to be(player2)
      end
    end

    describe 'paper' do
      it 'should beat rock' do
        player1.picks :paper and player2.picks :rock
        expect(game.winner).to be(player1)
      end

      it 'should lose to scissors' do
        player1.picks :paper and player2.picks :scissors
        expect(game.winner).to be(player2)
      end
    end

    describe 'scissors' do
      it 'should beat paper' do
        player1.picks :scissors and player2.picks :paper
        expect(game.winner).to be(player1)
      end

      it 'should lose to rock' do
        player1.picks :scissors and player2.picks :rock
        expect(game.winner).to be(player2)
      end
    end
  end

  context 'draws' do

    before(:each) do
      game.add_player(player1)
      game.add_player(player2)
    end
    
    describe 'any identical picks' do
      
      it 'should result in no winner' do
        draw_game_results = [:rock, :paper, :scissors].map do |x|
          player1.picks x and player2.picks x
          game.winner
        end
        expect(draw_game_results).to eq [nil, nil, nil]
      end
    end
  end
end