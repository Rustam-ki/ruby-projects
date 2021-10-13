# frozen_string_literal: true

puts 'Введите а'
a = gets.chomp

puts 'Введите b'
b = gets.to_i

puts 'Введите с'
c = gets.to_i

d = b**2 - (4 * a * c)

if d.positive?
  C = Math.sqrt(d)

  x1 = (- b + C) / 2 * a

  x2 = (-b - C) / 2 * a

  puts d.to_s, x1.to_s, x2.to_s

elsif d.zero?

  x1 = -b / (2 * a)

  puts d.to_s, x1.to_s

elsif d.negative?
  puts 'Корней нет'
end
