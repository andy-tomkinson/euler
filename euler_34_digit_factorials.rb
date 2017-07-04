=begin

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

Must be a maximum,
9! = 362880 (6 digits)
9! * 6 = 2177280 (7 digits)
9! * 7 = 2540160 (7 digits)
9! * 8 = 2903040 (7 digits)

maximum possible is 2540160

=end

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

def digit_factorial_sum(number)
  number == number.digits.collect { |i| i.fact }.reduce(:+)
end

def sum_for_range(maximum, minimum = 10)
  (minimum..maximum).each.select { |i| digit_factorial_sum(i) }.reduce(:+)
end

puts sum_for_range(2540160)
