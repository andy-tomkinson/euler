=begin

The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?

=end

require 'prime'

def factors_of(integer)
    (2..integer / 2).select { |n| (integer % n).zero? }
    # dirty hack we just divide target by 2 and hope for the best
end

def find_primes(array)
    array.select { |n| Prime.prime?(n) }
end

def find_x_consecutive_distinct_factors(x)
    found = false
    starting_value = 2
    value = starting_value
    i = 0
    until i == x
        if find_primes(factors_of(value + i)).count == x
            i += 1
            # puts value
        else
            value += 1 + i
            i = 0
        end
    end
    puts value
end

find_x_consecutive_distinct_factors(4)
            
