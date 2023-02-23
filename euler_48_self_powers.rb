=begin

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000&1000.

=end

def self_powers(upper)
    sum = 0
    (1..upper).each do |i|
        sum += i ** i
    end
    puts sum
end

self_powers(1000)

9110846700