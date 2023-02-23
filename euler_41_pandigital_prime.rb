=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

=end

require 'prime'

def pandigital?(num)
    num_string = num.to_s
    num_string.chars.map(&:to_i).sort == (1..num_string.length).to_a
end

def pandigital_prime?(num)
    if Prime.prime?(num)
        pandigital?(num)
    else
        false
    end
end

def find_largest_pandigital_prime_below(max_value)
    my_primes = []
    Prime.each(max_value) do |prime|
        my_primes << prime if pandigital?(prime)
    end
    my_primes.max
end

p find_largest_pandigital_prime_below(987654321)
