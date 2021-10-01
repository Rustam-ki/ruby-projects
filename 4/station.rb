class Station
  attr_reader :name
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
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