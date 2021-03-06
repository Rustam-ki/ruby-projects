# frozen_string_literal: true

require_relative 'company_name'
require_relative 'instance_counter'

class Train
  include CompanyName
  include InstanceCounter

  attr_reader :number, :type
  attr_accessor :station, :speed, :route, :trains_quant, :railway

  @@train_list = {}

  def initialize(number)
    @number = number
    @railway = []
    @@train_list[number] = self
    validate!
  end

  def validate!
    raise "Number can't be nill" if @number.nil?
    raise 'Number should be at least 6 symbols' if @number.length < 3
    raise 'Number has invalid format' if @number !~ /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}/
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_wagon(&block)
    railway.each(&block) if block_given?
  end

  def railway_each
    railway.each do |wagon|
      puts "Вагон номер #{wagon.numb}, тип #{wagon.type}, занято #{wagon.occupied_volume}, свободно #{wagon.free_volume}"
    end
  end

  def wagon_count
    @railway.length
  end

  def result
    puts "Поезд №#{@number} тип #{@type} вагонов #{wagon_count}"
  end

  def self.find(number)
    if @@train_list[number].nil?
      puts 'объект не найден'
    else
      @@train_list[number]
    end
  end

  def add_railway(rail)
    @railway << rail if rail.type == @type
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
    self.station = route.stations[route.stations.index(station) - 1] if route.stations[route.stations.index(station) - 1]
  end

  def move_next_station
    self.station = route.stations[route.stations.index(station) + 1] if route.stations[route.stations.index(station) + 1]
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

  def next_station
    route.stations[route.stations.index(station) + 1]
  end
end
