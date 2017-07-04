=begin

The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting
to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value,
and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

-----

fewer than 89 * 89 possible values (less than one in value and single digits are excluded)
10,20,30,40,50,60,70,80,90 will only return trivial examples

-----

analyse numerator and denominator for any shared digits
if none, return false
if one remove it from both numbers and compare values
if two then try for both numbers

-----

16 * 26 * 19 * 49
64   65   95   98

1 * 2 * 1 * 1
4   5   5   2

2
200

=end

def find_shared_digits(numerator,denominator)
  numerator.digits & denominator.digits
end

def compare_to_stripped_fraction(numerator,denominator,shared)
  numerator.to_f / denominator == numerator.digits.reject { |i| i == shared }[0].to_f / denominator.digits.reject { |i| i == shared }[0]
end

def cycle_denominators
  [*11..19,*21..29,*31..39,*41..49,*51..59,*61..69,*71..79,*81..89,*91..99].each do |denominator|
    [*11..19,*21..29,*31..39,*41..49,*51..59,*61..69,*71..79,*81..89,*91..99].each do |numerator|
      break if numerator >= denominator
      find_shared_digits(numerator,denominator).each do |shared|
        break if denominator.digits.reject { |i| i == shared }[0] == nil
        puts "#{numerator} / #{denominator} equals #{numerator.digits.reject { |i| i == shared }[0]} / #{denominator.digits.reject { |i| i == shared }[0]}" if compare_to_stripped_fraction(numerator,denominator,shared)
      end
    end
  end
end

cycle_denominators