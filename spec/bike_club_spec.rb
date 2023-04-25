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
end