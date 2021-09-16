puts "Введите а"
a = gets.chomp

puts "Введите b"
b = gets.to_i

puts "Введите с"
c = gets.to_i

d = b**2 - (4 * a * c)



if(d > 0)
	C = Math.sqrt(d)

	x1 = (- b + C)/2 * a

	x2 = (-b - C)/2 * a

	puts "#{d}", "#{x1}", "#{x2}"

elsif(d == 0)

	x1 = -b/(2 * a)

	puts "#{d}", "#{x1}"
	
elsif(d < 0)
	puts "Корней нет"
end