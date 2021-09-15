puts "Введите первую сторону треугольника"
a = gets.chomp

puts "Введите вторую сторону треугольника"
b = gets.chomp

puts "Введите третью сторону треугольника"
c = gets.chomp

if (a<b && b>c)
	if(b.to_i ** 2 == a.to_i ** 2 + c.to_i ** 2)

		puts "Треугольник прямоугольный"

	elsif(a == c)

		puts "Треугольник равнобедренный"

	end

elsif(b<a && a>c)
	if(a.to_i**2 == b.to_i**2 + c.to_i**2)

		puts "Треугольник прямоугольный"

	elsif(b == c)

		puts "Треугольник равнобедренный"

	end

elsif(a<c && c>b)
	if(c.to_i**2 == a.to_i**2 + b.to_i**2)

		puts "Треугольник прямоугольный"

	elsif(a == b)

		puts "Треугольник равнобедренный"

	end
elsif(a == c && c == b)

	puts "Треугольник равносторонний"

elsif(a == b && b != c)

	puts "Треугольник равнобедренный"

elsif(a == c && c != b)

	puts "Треугольник равнобедренный"

elsif(b == c && c != a)

	puts "Треугольник равнобедренный"


end
