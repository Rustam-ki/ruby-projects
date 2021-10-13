# frozen_string_literal: true

arr = [0, 1]

arr.push(arr.last + (arr[arr.count - 2])) while arr.last + arr[arr.count - 2] < 100

puts arr
