# frozen_string_literal: true

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

  def raise_back(_speed_back)
    self.speed -= speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage
    self.count += 1 if self.speed.zero?
  end

  def delete_carriage
    self.count -= 1 if self.speed.zero?
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(station) - 1] if route.stations[route.stations.index(station)] != 0
  end

  def move_previous_station
    if route.stations[route.stations.index(station)] != 0
      self.station = route.stations[route.stations.index(station) - 1]
    end
  end

  def move_next_station
    if route.stations[route.stations.index(station) + 1]
      self.station = route.stations[route.stations.index(station) + 1]
    end
  end
end
