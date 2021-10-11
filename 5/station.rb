require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name
  attr_reader :trains

  @@instances = 0

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances += 1
    validate!
  end

  def validate!
    raise "Name can't be nill" if @name.nil?
    raise "Name should be at least 6 symbols" if @name.length < 3
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def each_train
    trains.each { |train| yield(train) } if block_given?
  end

  def result
    trains.each do |train|
      puts "Поезд #{train.number}, тип #{train.type}, количество вагонов #{train.wagon_count}"
    end
  end

  def add_train(train)
    self.trains << train
  end

  def del_rain(train)
    self.trains.delete(train)
  end

  def trains_type(type)
    self.trains.select { |train| train.type == type }
  end
end