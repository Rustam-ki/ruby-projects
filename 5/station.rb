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
    register_instances
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