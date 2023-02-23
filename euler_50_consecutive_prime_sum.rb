=begin

The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?

=end

require 'prime'

# Can stop at 1,000,000 / 21 as we know that's a lower bound for consecutive sum

def primes_below(limit)
    Prime.each(limit).map { |p| p}
end

def primes_array
    primes_below(1000000 / 21)
end

def sum_consecutives
    primes = primes_array
    longest_run = 1
    max = 0
    primes.each_with_index do |prime, index|
        # puts "index is #{index}"
        unless longest_run > (primes.length - index)
            current = longest_run_for(primes[index..-1], longest_run)
            if current > longest_run
                longest_run = current
                max = primes[index..(index + longest_run)].sum
            end
        end
    end
    puts max
    puts longest_run + 1
end

def longest_run_for(primes, current_run, longest_run = 0)
    # print primes
    sum = primes[0..current_run].sum
    if current_run > primes.length
        longest_run
    elsif sum > 1000000
        longest_run
    elsif Prime.prime?(sum)
        longest_run_for(primes, current_run + 1, current_run)
    else
        longest_run_for(primes, current_run + 1, longest_run)
    end
end


sum_consecutives
# p primes_array.count
