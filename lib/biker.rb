class Biker
  attr_reader :name,
              :max_distance,
              :rides, 
              :acceptable_terrain
  
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = Hash.new {|hash_obj, key| hash_obj[key] = []}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time) 
    if know_terrain?(ride.terrain) && distance_capable?(ride)
      @rides[ride] << time
    elsif !know_terrain?(ride.terrain) 
      "#{@name} doesn't know this terrain yet"
    elsif !distance_capable?(ride)
      "#{@name} can't bike this distance"
    end
  end

  def personal_record(ride)
    @rides[ride].min
  end

  #helpers
  def distance_capable?(ride)
    @max_distance >= ride.total_distance
  end

  def know_terrain?(terrain)
    @acceptable_terrain.include?(terrain)
  end
end