require_relative 'train'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_railway'
require_relative 'cargo_railway'
require_relative 'station'
require_relative 'route'

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
				 stop чтобы выйти из программы"
      command = gets.chomp.to_i

      if command == 1
        create_station
      elsif command == 2
        create_train
      elsif command == 3
        create_route
      elsif command == 4
        add_station
      elsif command == 5
        del_station
      elsif command == 6
        put_on_route
      elsif command == 7
        add_a_car
      elsif command == 8
        del_a_car
      elsif command == 9
        train_move_next
      elsif command == 10
        train_move_back
      elsif command == 11
        list_of_stations
      elsif command == 12
        list_of_trains
      else
        command == "stop"
        break
      end
    end
  end

  private

  def create_station
    puts "Введите название станции?"
    @name_st = gets.chomp
    @name_st = Station.new(@name_st)
    puts "Создана станция #{@name_st.name}"
  end

  def create_train
    puts "Введите номер поезда?"
    @number = gets.chomp

    puts "Введите тип поезда cargo или passenger"
    @type = gets.chomp

    if @type == "cargo"
      @number = CargoTrain.new(@number)
      @name_st.add_train(@number)
      puts "Грузовой поезд создался #{@number}, #{@trains_quant}"
    elsif @type == "passenger"
      @number = PassengerTrain.new(@number)
      @name_st.add_train(@number)
      puts "Создан пассажирский поезд #{@number.number}"
    end
  end

  def create_route
    puts "Введите название, начальную и конечную станцию маршрута"
    @name_route = gets.chomp
    start = gets.chomp
    ending = gets.chomp
    @name_route = Route.new(start, ending)
    puts "Создан маршрут #{@name_route}"
  end

  def add_station
    puts "Введите название станции"
    @new_st = gets.chomp
    @name_route.add_st(@new_st)
    puts "Станция добавлена"
  end

  def del_station
    puts "Введите название станции"
    @del_st = gets.chomp
    @name_route.add_st(@del_st)
    puts "Станция удалена"
  end

  def put_on_route
    @number.router(@name_route)
    puts "Поезд поставлен на маршрут"
  end

  def add_a_car
    if @type == "cargo"
      @railway_numb = CargoRailway.new
      @number.add_railway(@railway_numb)
    elsif @type == "passenger"
      @railway_numb = PassengerRailway.new
      @number.add_railway(@railway_numb)
    end
  end

  def del_a_car
    if @type == "cargo"
      @number.del_railway(@railway_numb)
    elsif @type == "passenger"
      @number.del_railway(@railway_numb)
    end
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