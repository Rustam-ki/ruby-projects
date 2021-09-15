puts "Как тебя зовут?"
name = gets

puts "Какой у тебя рост?"
height = gets.chomp

	weight = (height.to_i - 110)*1.15

if(weight<0)
	puts "Ваш вес уже идеальный #{name}"
end


