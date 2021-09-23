class Train
  attr_reader :number, :type, :route
  attr_accessor :station, :speed, :count


  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end

  def raise_speed(speed)
    self.speed += speed
  end

  def raise_back(speed_back)
    self.speed -= speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage
    if self.speed == 0
      self.count += 1
    end
  end

  def delete_carriage
    if self.speed == 0
      self.count -= 1
    end
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end

  def next_station
    self.route.stations[self.route.stations.index(self.station) + 1]
  end

  def previous_station
    if(self.route.stations[self.route.stations.index(self.station) - 1])
      self.route.stations[self.route.stations.index(self.station) - 1]
    else 
      nil
    end
  end

  def move_next_station
    self.station = self.route.stations[self.route.stations.index(self.station) + 1]
  end
end