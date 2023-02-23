=begin

A unit fraction contains 1 in the numerator.
The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2 =   0.5
1/3 =   0.(3)
1/4 =   0.25
1/5 =   0.2
1/6 =   0.1(6)
1/7 =   0.(142857)
1/8 =   0.125
1/9 =   0.(1)
1/10  =   0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

=end

require 'bigdecimal'


def pattern?(string,length)
  string.first(length) == string.drop(length).first(length)
end

def back_pattern?(array,length)
  array.last(length) == array[0..-(length + 1)].last(length)
end

def pattern_length(decimal)
  decimal = sanitise(decimal)
  length = 1
  max_length = 0
  until pattern?(decimal,length)
    until (pattern?(decimal,length)) || (length >= decimal.length)
      length += 1
    end
    #puts length
    decimal = decimal[0..-2]
    length = 1 if length >= decimal.length
  end
  length
end

def sanitise(fraction)
  fraction.to_s.each_char.map.drop(2)
end

# how to ignore SOME leading 1s eg '0.1(6)' but not others eg 0.(142857)?
# do I need to test for a pattern from every digit?
# must be a neater way of doing this!


#i = 17
#n = sprintf "%0.0100f", 1.0 / i
#puts (n)

def lets_do_this
  x = BigDecimal('1.0')
  max = 0
  answer = 0
  (1..1000).each do |i|
    unless i.even?
      unless i % 5 == 0
        @i = BigDecimal(i)
        n = BigDecimal(x.div(@i,4000))
        length_check = pattern_length(n)
        if length_check > max
          max = length_check
          answer = i
          puts max
        end
      end
    end
  end
  p "Answer is #{answer}"
end

lets_do_this
#m = (1.0 / 73).to_s.each_char.map.drop(2)
#print m
#puts back_pattern?(m,8)

=begin
i = 998

n = BigDecimal.new('1.0')
puts n
puts 1.0 / i 
puts n.div(i,200)

puts pattern_length(n.div(i,))
=end
# puts (9 ** 21).to_s.length
# puts BigDecimal(1.0,5).div(BigDecimal(982),10000)
