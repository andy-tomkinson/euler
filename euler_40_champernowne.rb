=begin

An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

=end

def champernowne_digit(target_digit)
    champ_str = ''
    i = 1
    until champ_str.length >= target_digit do
        champ_str += i.to_s
        i += 1
    end
    # (0..target_digit).each do |i|
    #     champ_str += i.to_s
    # end
    current_digit = 1
    digit_product = 1
    until current_digit > target_digit
        p current_digit
        p champ_str[current_digit - 1].to_i
        digit_product *= champ_str[current_digit - 1].to_i
        current_digit *= 10
    end
    # champ_str[target_digit]
    digit_product
end

p champernowne_digit(1000000)

