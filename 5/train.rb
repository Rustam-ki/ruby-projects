require_relative 'company_name'
require_relative 'instance_counter'

class Train
  include CompanyName
  include InstanceCounter

  attr_reader :number, :type
  attr_accessor :station, :speed, :route, :trains_quant, :railway

  @@train_list = {}

  def initialize(number)
    register_instances
    @number = number
    @railway = []
    @@train_list[number] = self
    validate!
  end

  def validate!
    raise "Number can't be nill" if @number.nil?
    raise "Number should be at least 6 symbols" if @number.length < 3
    raise "Number has invalid format" if @number !~ /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}/
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def self.find(number)
    if @@train_list[number].nil?
      puts "объект не найден"
    else
      @@train_list[number]
    end
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

  def next_station
    self.route.stations[self.route.stations.index(self.station) + 1]
  end

end