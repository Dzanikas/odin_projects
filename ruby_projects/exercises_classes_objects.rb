class Vehicle
  attr_accessor :model, :year, :color, :speed

  @@vehicle_count = 0

  def initialize (m, y, c, s = 0)
    @model = m
    @year = y
    @color = c
    @speed = s
    @@vehicle_count += 1
  end

  def self.vehicle_count
    puts "The number of vehicles is #{@@vehicle_count}."
  end

  def self.mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def change_info(m, y, c)
    self.model = m
    self.year = y
    self.color = c
  end

  def speed_up(a)
    self.speed += a.to_i
    puts "Accelerated to: #{speed}"
  end  

  def break
    self.speed = self.speed * 0.8
    puts "Slow downed to: #{speed}"
  end

  def shut_off
    self.speed = 0
    puts "Engine shut down!"
  end

end

module Info
  def to_s
    "#{self.class::OWNER}'s car is a #{color} #{model} from #{year}, and it's moving at the speed of #{speed}km/h."
  end
end

class MyCar < Vehicle
  OWNER = "Carl"
  include Info

  def age
    age_calc
  end

  private

  def age_calc
    Time.now.year - self.year.to_i
  end
end

class MyTruck < Vehicle
  OWNER = "Bob"
  include Info
end

car_1 = MyCar.new("Toyota", "1995", "red")
car_2 = MyCar.new("Hundai", "2004", "silver")
puts car_1, car_2
truck = MyTruck.new("Lincoln", "2010", "black")
puts truck
Vehicle.vehicle_count
puts car_1.age
puts MyCar.ancestors