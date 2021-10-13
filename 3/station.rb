# frozen_string_literal: true

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
