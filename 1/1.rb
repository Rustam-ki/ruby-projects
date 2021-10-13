# frozen_string_literal: true

puts 'Как тебя зовут?'
name = gets

puts 'Какой у тебя рост?'
height = gets.to_i

weight = (height - 110) * 1.15

puts "Ваш вес уже идеальный #{name}" if weight.negative?
