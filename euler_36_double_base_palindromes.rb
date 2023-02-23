=begin

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

=end

def palindrome?(num)
    num.to_s == num.to_s.reverse
end

def doublebase_palindrome?(num)
    if palindrome?(num)
        palindrome?(num.to_s(2))
    else
        false
    end
end

def sum_doublebase_palindromes_to(lim)
    sum = 0
    (0..lim).each do |number|
        sum += number if doublebase_palindrome?(number)
    end
    sum
end

p sum_doublebase_palindromes_to(1000000)
