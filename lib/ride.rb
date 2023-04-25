class Ride
  attr_reader :name,
              :distance, 
              :terrain
  
  def initialize(attributes)
    @name = attributes[:name]
    @distance = attributes[:distance]
    @terrain = attributes[:terrain]
  end
end