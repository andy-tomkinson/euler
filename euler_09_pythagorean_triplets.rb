=begin

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

a^2 + b^2 = c^2
a + b + c = 1000
1 < a < 995
2 < b < 996
3 < c < 997

Euclid's formula[1] is a fundamental formula for generating Pythagorean triples given an 
arbitrary pair of integers m and n with m > n > 0. The formula states that the integers
a=m^{2}-n^{2}
b=2mn
c=m^{2}+n^{2}

=end

def euclid(m, n)
  @a = (m * m) - (n * n)
  @b = 2 * m * n
  @c = (m * m) + (n * n)
  puts "#{m}, #{n} gives #{@a}, #{@b}, #{@c} = #{@a + @b + @c}"
  puts (@a * @b * @c).to_s
  @a + @b + @c
end

# increase m until 1000 or greater
# if greater, decrease m and increase n

def wiggle(target)
  m = 2
  n = 1
  happy = false
  until happy
    if euclid(m, n) < target
      m += 1
    elsif euclid(m, n) > target
      m -= 1
      n += 1
    elsif euclid(m, n) == target
      happy = true
    end
  end
  puts euclid(m,n)
end

def bastard
(1..1000).each do |a|
    (1..1000 - a).each do |b|
        c = 1000 - (a + b)
        if a < b and b < c and (a * a) + (b * b) == (c * c)
            print(a * b * c)
          end
        end
      end
    end

bastard
