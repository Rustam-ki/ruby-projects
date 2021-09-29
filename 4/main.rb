require_relative 'train'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_railway'
require_relative 'cargo_railway'
require_relative 'station'
require_relative 'route'

class INTERFACE 

loop do
	puts "
			 Введите команду:
			 1. Создать поезд
			 2. Создать станцию
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
  	puts "Введите номер поезда?"
    @number = gets.chomp

    puts "Введите тип поезда cargo или passenger"
    type = gets.chomp

    if type == "cargo"
      @number = CargoTrain.new(@number)
      puts "Грузовой поезд создался #{@number}"
    elsif type == "passenger"
      @number = PassengerTrain.new(@number)
      puts "Создан пассажирский поезд #{@number.number}"
    end
	elsif command == 2
		puts "Введите название станции?"
		@name_st = gets.chomp
		@name_st = Station.new(@name_st)
		@name_st.add_train(@number)
		puts "Создана станция #{@name_st.name}"

	elsif command == 3
		puts "Введите название, начальную и конечную станцию маршрута"
		@name_route = gets.chomp
		start = gets.chomp
		ending = gets.chomp
		@name_route = Route.new(start, ending)
		puts "Создан маршрут #{@name_route}"

	elsif command == 4
		puts "Введите название станции"
		@new_st = gets.chomp
		@name_route.add_st(@new_st)
		puts "Станция добавлена"

	elsif command == 5
		puts "Введите название станции"
		@del_st = gets.chomp
		@name_route.add_st(@del_st)
		puts "Станция удалена"
	elsif command == 6
			@number.router(@name_route)
			puts "Поезд поставлен на маршрут"
		
	elsif command == 7 
		if type == "cargo"
			@railway_numb = CargoRailway.new
			@number.add_railway(@railway_numb)
		elsif type == "passenger"
			@railway_numb = PassengerRailway.new
			@number.add_railway(@railway_numb)
		end
	elsif command == 8
		if type == "cargo"
	   @number.del_railway(@railway_numb)
		elsif type == "passenger"
	   @number.del_railway(@railway_numb)
	  end
	elsif command == 9 
		@number.move_next_station
	elsif command == 10
		@number.move_previous_station
	elsif command == 11
		puts @name_route.stations
	elsif command == 12
		puts @name_st.trains
	else command == "stop"
		break
	end

end
end



=begin

puts "Введите название станции?"
name_st = gets.chomp
name_st = Station.new(name_st)
puts "Создана станция #{name_st.name}"

#####################################################################

puts "Введите номер поезда?"
number = gets.chomp
puts "Введите тип поезда cargo или passenger"
type = gets.chomp

if type == "cargo"
	number = CargoTrain.new(number)

	puts "Грузовой поезд создался #{number}"
elsif type == "passenger"
	number = PassengerTrain.new(number)
	puts "Создан пассажирский поезд #{number.number}"
end

#######################################################################



puts "Введите название, начальную и конечную станцию маршрута"
name_route = gets.chomp
start = gets.chomp
ending = gets.chomp

name_route = Route.new(start, ending)

puts "Чтобы добавить станцию введите add чтобы удалить del далее название станции"
com = gets.chomp
name_st = gets.chomp

if com == "add"
	name_route.add_st(name_st)
	puts "Станция добавлена"
elsif com == "del"
	name_route.del_st(name_st)
	puts "Станция удалена"
end

#######################################################################

puts "Введите routing чтобы поставить поезд на маршрут"
routing = gets.chomp

if routing == "routing"
	number.router(name_route)
	puts "Поезд поставлен на маршрут"
end

puts "Введите номер вагона для создания"
railway_numb = gets.chomp

puts "Введите add чтобы добавить вагон"
railway_com = gets.chomp

if railway_com == "add" && type == "cargo"
	railway_numb = CargoRailway.new
	number.add_railway(railway_numb)
elsif railway_com == "add" && type == "passenger"
	railway_numb = PassengerRailway.new
	number.add_railway(railway_numb)
end

puts "Введите del чтобы удалить вагон"
railway_com = gets.chomp

if railway_com == "del" && type == "cargo"
	railway_numb = CargoRailway.new
	number.del_railway(railway_numb)
elsif railway_com == "del" && type == "passenger"
	railway_numb = PassengerRailway.new
	number.del_railway(railway_numb)
end

puts "Введите next для перемещени поезда след станцию и back на предыдущую"
next_st = gets.chomp

if next_st == "next"
	number.move_next_station
elsif next_st == "back"
	number.move_previous_station
end


puts "Список станций" . name_route.stations
puts "Список поездов на станции" . name_st.trains
=end