require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({
      name: "Walnut Creek Trail", 
      distance: 10.7, 
      loop: false, 
      terrain: :hills
    })
    @ride2 = Ride.new({
      name: "Town Lake", 
      distance: 14.9, 
      loop: true, 
      terrain: :gravel
    })
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@ride1).to be_a Ride
      expect(@ride2).to be_a Ride
    end

    it 'has attributes' do 
      expect(@ride1.name).to eq('Walnut Creek Trail')
      expect(@ride1.distance).to eq(10.7)
      expect(@ride1.terrain).to eq(:hills)
      expect(@ride2.name).to eq('Town Lake')
      expect(@ride2.distance).to eq(14.9)
      expect(@ride2.terrain).to eq(:gravel)
    end
  end

  describe '#loop?' do 
    it '#loop? can be false' do 
      expect(@ride1.loop?).to be false
    end

    it '#loop? can be true' do 
      expect(@ride2.loop?).to be true
    end
  end

  describe '#total_distance' do 
    it 'out and back trails #total_distance' do 
      expect(@ride1.total_distance).to eq(21.4)
    end
    
    it 'loop total distance' do 
      expect(@ride2.total_distance).to eq(14.9)
    end
  end
end