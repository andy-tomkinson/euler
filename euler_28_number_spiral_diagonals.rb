=begin

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

1, 3, 5, 7, 9, 13, 17, 21, 25
1, 3, 5, 7, 9, 13, 17, 21, 25, 31, 37, 43, 49

+2s, +4s, +6s...

using integer division
term 0 = 1
terms 1-4 : +2
terms 5-8 : +2 * 2
terms 9-12: +2 * 3

(width - 1 / 2) * 4 + 1

=end

def next_value(position, previous_value)
  previous_value + (((position + 3) / 4) * 2)
end

def spiral_diagonal_sum(width)
  sum = 0
  value = 1
  (0..((width - 1) * 2)).each do |i|
    value = next_value(i, value)
    sum += value
  end
  sum
end

puts spiral_diagonal_sum(1001)
