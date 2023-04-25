require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new('Free Willies')
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do 
    it 'exists & has attributes' do 
      expect(@bike_club1).to be_a BikeClub
      expect(@bike_club1.name).to eq('Free Willies')
    end
  end

  describe 'bikers' do 
    it 'starts without bikers' do 
      expect(@bike_club1.bikers).to eq([])
    end

    it 'can add and list bikers' do 
      @bike_club1.add_biker(@biker)
      @bike_club1.add_biker(@biker2)
      expect(@bike_club1.bikers).to eq([@biker, @biker2])
    end
  end

  describe 'most rides' do 
    it '#most_rides' do 
      @bike_club1.add_biker(@biker)
      @bike_club1.add_biker(@biker2)
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      @biker2.log_ride(@ride1, 92.5)
      @biker2.log_ride(@ride1, 91.1)
      @biker2.log_ride(@ride2, 60.9)
      @biker2.log_ride(@ride2, 61.6)
      require 'pry'; binding.pry
      expect(@bike_club1.most_rides).to eq(@biker)
    end
  end

  describe 'eligibility' do 
    it '#eligible_bikers' do 
      @bike_club1.add_biker(@biker)
      @bike_club1.add_biker(@biker2)
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@bike_club1.eligible_bikers(@ride1)).to eq([@biker])
      expect(@bike_club1.eligible_bikers(@ride2)).to eq([@biker])
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@bike_club1.eligible_bikers(@ride1)).to eq([@biker])
      expect(@bike_club1.eligible_bikers(@ride2)).to eq([@biker, @biker2])
    end
  end
end