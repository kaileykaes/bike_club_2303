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
    @rides[ride] << time
  end

  def personal_record(ride)
    @rides[ride].min
  end
end