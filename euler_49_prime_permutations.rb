=begin

The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
    
=end

require 'prime'

def four_digit_primes
    (1111..9999).to_a.select { |n| Prime.prime?(n) }
end

def group_by_permutation
    array = four_digit_primes
    mapping = {}
    array.each do |n|
        reordered = n.to_s.split('').sort.join
        mapping[reordered] ||= []
        mapping[reordered] << n
    end
    mapping.each do |key, array|
        mapping.delete(key) if array.count < 3
    end
    mapping
end

def find_common_differences(array)
    differences = array.map do |item|
        array.map { |n| n - item }
    end
    differences.each_with_index do |subarray, index|
        subarray.each_with_index do |element, i|
            if differences[i].include?(element)
                unless index == i
                    if element > 0
                        puts "Difference is #{element}"
                        puts array[index] 
                        puts array[index] + element
                        puts array[index] + element + element
                        puts '===='
                    end
                end
            end
        end
    end
end

puts group_by_permutation

group_by_permutation.each do |key, array|
    find_common_differences(array)
end


# find_common_differences(foo)
