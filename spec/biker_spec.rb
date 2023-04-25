require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@biker).to be_a Biker
    end

    it 'has attributes' do 
      expect(@biker.name).to eq('Kenny')
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe 'terrain' do 
    it '#learn_terrain!' do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe 'rides' do 
    it '#log_ride' do 
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides).to eq({
        @ride1 => [92.5, 91.1], 
        @ride2 => [60.9, 61.6]
      })
    end

    it '#personal_record' do 
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end

    it '#log_ride if terrain ignorance' do 
      expect(@biker2.log_ride(@ride1, 97.0)).to eq("Athena doesn't know this terrain yet")
      expect(@biker2.log_ride(@ride2, 67.0)).to eq("Athena doesn't know this terrain yet")
      expect(@biker2.rides).to eq({})
    end

    it '#log_ride if max distance incompatibility' do 
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@biker2.log_ride(@ride1, 95.0)).to eq("Athena can't bike this distance")
    end

    it '#log_ride message if compatible' do 
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@biker2.log_ride(@ride2, 65.0)).to eq("Athena knows this terrain and can bike this distance")
    end

    it '#personal_record if limited ride compatibility' do 
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)
      expect(@biker2.rides).to eq({
        @ride2 => [65.0]
      })
      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to be false
    end
  end
end