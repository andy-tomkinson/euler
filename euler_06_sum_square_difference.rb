=begin

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and
the square of the sum is 3025 − 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

=end

def sum_square(max)
  sum = 0
  (1..max).each do |num|
    sum += (num * num)
  end
  sum
end

def square_sum(max)
  square = 0
  (1..max).each do |num|
    square += num
  end
  square * square
end

def s_s_diff(max)
  array = [sum_square(max), square_sum(max)]
  array.max - array.min
end

puts s_s_diff(100)
