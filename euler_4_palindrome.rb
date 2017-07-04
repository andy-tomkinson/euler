# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers
# is 9009 = 91 * 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# while not palindrome
# result = x * y

@max = 0

def palindrome?(num)
  num.to_s == num.to_s.reverse
end

def newmax(num)
  @max = num if palindrome?(num) && (num > @max)
end

(100..999).collect { |x| (100..999).collect { |y| newmax(x * y) } }

puts @max
