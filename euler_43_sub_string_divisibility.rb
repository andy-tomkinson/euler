=begin

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.

=end


def sub_string_prime_multiple?(num, index)
    primes = [2,3,5,7,11,13,17]
    num.to_s.chars[index+1..index+3].join.to_i % primes[index] == 0
end

def sub_string_compliant?(num)
    (0..6).to_a.collect do |i|
        return false unless sub_string_prime_multiple?(num, i)
    end
    true
end

def pandigital?(num)
    num.to_s.chars.map(&:to_i).sort == [0,1,2,3,4,5,6,7,8,9]
end

def pandigitals
    [0,1,2,3,4,5,6,7,8,9].permutation.length
end

def pandigital_compliant_sum
    sum = 0
    [0,1,2,3,4,5,6,7,8,9].permutation.to_a.each do |number|
        number = number.join.to_i
        if sub_string_compliant?(number)
            p number
            p 'Found one!'
            sum += number
        end
    end
    p sum
end

pandigital_compliant_sum
    