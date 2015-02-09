require 'rspec'
require_relative '../lib/player'

describe 'Player' do

  let(:player1) { Player.new 'A' }
  
    it 'can have a name' do 
     expect(player1.name).to be_a String
    end

    it 'can accrue points' do
      player1.add_point 
      expect(player1.score).to equal(1)
    end 

  end