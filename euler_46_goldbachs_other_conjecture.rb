=begin

It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×1**2
15 = 7 + 2×2**2
21 = 3 + 2×3**2
25 = 7 + 2×3**2
27 = 19 + 2×2**2
33 = 31 + 2×1**2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

=end

# composite number: not prime or 1

require 'prime'

def next_odd_composite(current)
    composite = false
    until composite do
        composite = !Prime.prime?(current += 2)
    end
    current
end

# for powers of 2 up to sqrt of current odd composite, check if the remainder is prime

def conjecture_holds?(value)
    #squares up to sqrt of value
    (1..Math.sqrt(value)).to_a.any? { |square| Prime.prime?(value - 2 * (square ** 2)) }        
end

def test_conjecture
    broken = false
    value = 9
    until broken do
        value = next_odd_composite(value)
        broken = !conjecture_holds?(value)
    end
    value
end

p test_conjecture