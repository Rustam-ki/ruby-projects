# frozen_string_literal: true

require_relative 'train'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_railway'
require_relative 'cargo_railway'
require_relative 'route'
require_relative 'company_name'

class INTERFACE
  def menu
    loop do
      puts "Введите команду:
          1. Создать станцию
          2. Создать поезд
          3. Создать маршрут
          4. Добавить станцию в маршрут
          5. Удалить станцию в маршрут
          6. Назначить маршрут поезду
          7. Добавить вагон к поезду
          8. Удалить вагон поезда
          9. Переместить поезд вперед
          10. Переместить поезд назад
          11. Посмотреть список станций
          12. Посмотреть список поездов на станции
          13. Создать компанию поезда
          14. Создать компанию вагона
          15. Занять место в вагоне
          16. Список поездов на станции
          17. Список вагонов для поездов
          stop чтобы выйти из программы"
      command = gets.chomp.to_i

      case command
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        add_station
      when 5
        del_station
      when 6
        put_on_route
      when 7
        add_a_car
      when 8
        del_a_car
      when 9
        train_move_next
      when 10
        train_move_back
      when 11
        list_of_stations
      when 12
        list_of_trains
      when 13
        create_company_train
      when 14
        create_company_wagon
      when 15
        take_a_seat
      when 16
        tr_name
      when 17
        all_wagons
      when 'stop'
        break
      end
    end
  end

  private

  def create_station
    puts 'Введите название станции?'
    @name_st = gets.chomp
    @name_st = Station.new(@name_st)
    puts "Создана станция #{@name_st.name}"
  end

  def tr_name
    @name_st.result
  end

  def create_train
    puts 'Введите номер поезда?'
    @number = gets.chomp

    puts 'Введите тип поезда cargo или passenger'
    @type = gets.chomp

    case @type
    when 'cargo'
      @number = CargoTrain.new(@number)
      @name_st.add_train(@number)
      puts "Грузовой поезд создался #{@number}, #{@trains_quant}"
    when 'passenger'
      @number = PassengerTrain.new(@number)
      @name_st.add_train(@number)
      puts "Создан пассажирский поезд #{@number.number}"
    else
      raise 'Error try again'
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_company_train
    puts 'Введите название компании?'
    @company = gets.chomp
    @number.company(@company)
  end

  def create_company_wagon
    puts 'Введите название компании?'
    @company = gets.chomp
    @railway_numb.company(@company)
  end

  def create_route
    puts 'Введите название, начальную и конечную станцию маршрута'
    @name_route = gets.chomp
    start = gets.chomp
    ending = gets.chomp
    @name_route = Route.new(start, ending)
    puts "Создан маршрут #{@name_route}"
  end

  def add_station
    puts 'Введите название станции'
    @new_st = gets.chomp
    @name_route.add_st(@new_st)
    puts 'Станция добавлена'
  end

  def del_station
    puts 'Введите название станции'
    @del_st = gets.chomp
    @name_route.add_st(@del_st)
    puts 'Станция удалена'
  end

  def put_on_route
    @number.router(@name_route)
    puts 'Поезд поставлен на маршрут'
  end

  def add_a_car
    case @type
    when 'cargo'
      puts 'Введите объем грузового вагона'
      @total_volume = gets.chomp.to_i
      @railway_numb = CargoRailway.new(@total_volume)
      @number.add_railway(@railway_numb)
    when 'passenger'
      puts 'Введите количество мест'
      @number_of_seats = gets.chomp.to_i
      @railway_numb = PassengerRailway.new(@number_of_seats)
      @number.add_railway(@railway_numb)
    end
  end

  def all_wagons
    @number.railway_each
  end

  def take_a_seat
    case @type
    when 'passenger'
      @railway_numb.add_seats
    when 'cargo'
      puts 'Введите занимаемый объем'
      @volume = gets.chomp.to_i
      @railway_numb.load(@volume)
    end
  end

  def del_a_car
    case @type
    when 'cargo'
      @number.del_railway(@railway_numb)
    when 'passenger'
      @number.del_railway(@railway_numb)
    end
  end

  def wagon_list
    @number.result
  end

  def train_move_next
    @number.move_next_station
  end

  def train_move_back
    @number.move_previous_station
  end

  def list_of_stations
    puts @name_route.stations
  end

  def list_of_trains
    puts @name_st.trains
  end
end

main = INTERFACE.new
main.menu
