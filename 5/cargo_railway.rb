class CargoRailway

  attr_reader :type, :total_volume, :numb

  def initialize(total_volume, numb = rand(100))
    @type = "cargo"
    @total_volume = total_volume
    @numb = numb
    @volume = 0
  end

  def load(volume)
    raise StandardError, 'Вагон перегружен' if @volume + volume > total_volume

    @volume += volume
  end

  def unload(volume)
    raise StandardError, 'Вагон пуст' if (@volume - volume).negative?

    @volume -= volume
  end

  def free_volume
    @total_volume - @volume
  end

  def occupied_volume
    @volume
  end

  def result
    "Вагон №#{@numb}, тип #{@type} загружено #{occupied_volume}, свободно #{free_volume}"
  end
end

