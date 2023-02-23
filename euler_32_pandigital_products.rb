=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

=end

def pandigital?(multiplicand, multiplier, product)
    (multiplicand.to_s + multiplier.to_s + product.to_s).chars.map(&:to_i).sort == [1,2,3,4,5,6,7,8,9]
end

def collect_pandigital_products
    collection = []
    (1..98).each do |multiplicand|
        unless multiplicand % 11 == 0
            (123..9876).each do |multiplier|
                product = multiplicand * multiplier
                collection << product if pandigital?(multiplicand, multiplier, product)
            end
        end
    end
    collection.uniq.sum
end

p collect_pandigital_products

# smallest 2 digit = 12
# largest 2 digit = 98
# smallest 3 digit = 123
# largest 3 digit = 987