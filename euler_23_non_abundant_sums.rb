=begin

A perfect number is a number for which the sum of its
proper divisors is exactly equal to the number.
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is
less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than
28123 can be written as the sum of two abundant numbers. However, this upper
limit cannot be reduced any further by analysis even though it is known that
the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end

def divisors_of(number)
  (1..Math.sqrt(number)).select { |i| number % i == 0}.flat_map { |i| [i, number / i]}.reject { |i| i == number}.uniq
end

def divisor_sum_of(number)
  divisors_of(number).reduce(:+)
end

def is_abundant?(number)
  number < divisor_sum_of(number)
end

def abundant_array
  (12..28111).select { |i| is_abundant?(i) }
end

def abundant_sums_array
  abundants = abundant_array
  abundant_sums = []
  abundants.each do |a|
    abundants.each do |b|
      abundant_sums << a + b if (a + b) <= 28123
    end
    abundants = abundants.drop(1)
  end
  abundant_sums.uniq.sort
end

def non_abundant_sums_array
  numbers = (1..28123).to_a
  (numbers - abundant_sums_array)
end

puts non_abundant_sums_array.reduce(:+)

