# frozen_string_literal: true

class PassengerRailway
  attr_reader :type, :number_of_seats

  def initialize(number_of_seats, numb = rand(100))
    raise StandardError, 'Количество мест должно быть больше нуля' if number_of_seats <= 0

    @number_of_seats = number_of_seats
    @type = 'passenger'
    @numb = numb
    @seats = []
  end

  def add_seats
    raise StandardError, 'Все места заняты' if seats_length >= number_of_seats

    @seats << 1
  end

  def seats_length
    @seats.length
  end

  def leave_seat
    raise StandardError, 'Все места свободны' if free_seats == number_of_seats

    @seats.pop
  end

  def free_seats
    number_of_seats - seats_length
  end

  def result
    "Занято #{seats_length} мест, свободно #{free_seats}"
  end
end
