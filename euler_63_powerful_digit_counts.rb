# euler_63_powerful_digit_counts.rb

=begin
  
The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
  
=end

# 10 ^ n is always n + 1 digits, anything above 10 will also fail
# 1 ^ n is always 1, and thus will fail for any number above 1
# 0 is not a +ve integer, thus range is 1 - 9

def power_count(power)
  count = 0
  (1..9).each do |number|
    count += 1 if (number ** power).to_s.length == power
  end
  count
end

def power_count_cycle(min, max)
  total = 0
  (min..max).each do |power|
    total += power_count(power)
  end
  total
end

puts power_count_cycle(1,21)