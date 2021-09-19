alphabet = ('a'..'z')
alphabet = alphabet.to_a #можно сразу определить как массив, сэкономил время не стал заполнять)
vowels = ["a", "e", "i", "o", "u", "y"]
hash = {}

alphabet.each do |letter|
	if vowels.include?(letter)
		hash[letter] = alphabet.index(letter) + 1 
	end
end

puts hash