# frozen_string_literal: true

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
result = 0
puts 'Введите день'
day = gets.to_i
result += day

puts 'Введите месяц'
month = gets.to_i

puts 'Введите год'
year = gets.to_i

(0..month - 2).each do |i|
  result += days[i]
end

if (year % 400).zero? && (year % 100).zero?
  result += 1
elsif (year % 4).zero?
  result += 1
end

puts result
