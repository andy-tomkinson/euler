=begin

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=end
require 'prime'

def cycle(string)
  string[1..-1] + string[0]
end

def circular?(prime)
  prime = prime.to_s
  return false if %w[0 2 4 5 6 8].any? { |char| prime.include?(char) }
  prime.length.times do
    return false unless prime.to_i.prime?
    prime = cycle(prime)
  end
  true
end

def count_circular(max)
  Prime.each(max).select { |prime| circular?(prime) }.count + 2
end

puts count_circular(1_000_000)

# this approach quickly drops anything with an even number or five in it
# as when these are the last character they won't be primes
# we then add 2 to the count to account for numbers 2 and 5 being dropped
