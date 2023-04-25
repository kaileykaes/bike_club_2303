class BikeClub
  attr_reader :name, 
              :bikers
  
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def eligible_bikers(ride)
    @bikers.find_all do |biker|
      biker.distance_capable?(ride) && 
      biker.know_terrain?(ride.terrain)
    end
  end
end