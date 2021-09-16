puts "Введите первую сторону треугольника"
a = gets.to_i

puts "Введите вторую сторону треугольника"
b = gets.to_i

puts "Введите третью сторону треугольника"
c = gets.to_i

a, b, hypo = [a, b, c].sort

if(hypo**2 == a**2 + b**2)
	puts "Треугольник прямоугольный"	
elsif(a == hypo && hypo == b)
	puts "Треугольник равносторонний"
elsif(a == b && b != hypo)
	puts "Треугольник равнобедренный"
elsif(a == hypo && hypo != b)
	puts "Треугольник равнобедренный"
elsif(b == hypo && hypo != a)
	puts "Треугольник равнобедренный"
end
