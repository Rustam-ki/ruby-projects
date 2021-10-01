class Train
  attr_reader :number, :type
  attr_accessor :station, :speed, :route, :trains_quant, :railway

  def initialize(number)
    @number = number
    @railway = []
  end

  def add_railway(rail)
    if rail.type == @type
      @railway << rail
    end
    puts @railway
  end

  def del_railway(rail)
    @railway.delete(rail)
  end

  def router(route)
    @route = route
    self.station = self.route.stations.first
  end

  def move_previous_station
    if (self.route.stations[self.route.stations.index(self.station) - 1])
      self.station = self.route.stations[self.route.stations.index(self.station) - 1]
    else
      nil
    end
  end

  def move_next_station
    if (self.route.stations[self.route.stations.index(self.station) + 1])
      self.station = self.route.stations[self.route.stations.index(self.station) + 1]
    else
      nil
    end
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

  def router(route)
    @route = route
    self.station = self.route.stations.first
  end

  def next_station
    self.route.stations[self.route.stations.index(self.station) + 1]
  end

end