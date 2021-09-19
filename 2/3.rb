arr = [0, 1]

while arr.last + arr[arr.count - 2] < 100 do
	arr.push(arr.last + (arr[arr.count - 2]))
end

puts arr