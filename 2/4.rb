# frozen_string_literal: true

alphabet = ('a'..'z')
alphabet = alphabet.to_a # можно сразу определить как массив, сэкономил время не стал заполнять)
vowels = %w[a e i o u y]
hash = {}

alphabet.each do |letter|
  hash[letter] = alphabet.index(letter) + 1 if vowels.include?(letter)
end

puts hash
