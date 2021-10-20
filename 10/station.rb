# frozen_string_literal: true

require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

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
    raise 'Name should be at least 6 symbols' if @name.length < 3
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_train(&block)
    trains.each(&block) if block_given?
  end

  def result
    trains.each do |train|
      puts "Поезд #{train.number}, тип #{train.type}, количество вагонов #{train.wagon_count}"
    end
  end

  def add_train(train)
    trains << train
  end

  def del_rain(train)
    trains.delete(train)
  end

  def trains_type(type)
    trains.select { |train| train.type == type }
  end
end
