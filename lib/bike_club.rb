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

  def most_rides
    biker_rides = {}
    @bikers.each do |biker|
      biker_rides[biker] = biker.rides.values.flatten 
    end
    sir_rides_alot = biker_rides.max_by do |_, times| 
      times.length
    end
    sir_rides_alot[0]
  end

  def best_time(ride) 
    times_for_ride = {}
    @bikers.each { |biker| times_for_ride[biker] = biker.personal_record(ride) }
    require 'pry'; binding.pry
    da_absolute_fastest = times_for_ride.min_by{|_, time| time } 
    da_absolute_fastest[0]
  end
end