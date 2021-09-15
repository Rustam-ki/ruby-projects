puts "Введите а"
a = gets.chomp

puts "Введите b"
b = gets.chomp

puts "Введите с"
c = gets.chomp

d = b.to_i**2 - (4*a.to_i*c.to_i)



if(d>0)
	C = Math.sqrt(d)

	x1 = (-b.to_i + C.to_i)/2*a.to_i

	x2 = (-b.to_i - C.to_i)/2*a.to_i

	puts "#{d}", "#{x1}", "#{x2}"

elsif(d == 0)

	x1 = -b.to_i/(2*a.to_i)

	puts "#{d}", "#{x1}"

elsif(d<0)

	puts "Корней нет"

end