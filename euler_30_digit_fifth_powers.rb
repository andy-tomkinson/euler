=begin

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

-----

maximum value:

9^5 = 59049
5 * 9^5 = 295245
6 * 9^5 = 354294

six characters is the maximum, specifically no value above 354294 will work
minimum is 10 since x^4 is not a sum

=end

def fifth_power_digit_sum(number)
  number.digits.collect { |i| i ** 5}.reduce(:+)
end

def digit_fifth_powers(maximum = 354294)
  (10..maximum).select { |i| i == fifth_power_digit_sum(i) }.reduce(:+)
end

puts digit_fifth_powers