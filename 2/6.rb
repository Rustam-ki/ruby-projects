hash = {}
total_all = 0
total = 0

loop do
	puts "Введите название товара"
	name = gets.chomp

	break if name == 'stop'

	puts "Введите цену за еденицу"
	price = gets.to_f

	puts "Введите количество"
	quantiti = gets.to_f

	hash[name] = {price => quantiti}

	puts hash
	
	hash.each do |name, price|
		total = price.keys.first * price.values.first
		total_all += total

		puts "Стоимость данной покупки #{total}"
		puts "Итоговая стоимость #{total_all}"
	end	
end

