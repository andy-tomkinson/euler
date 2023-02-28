=begin

By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

=end

require 'prime'

def prime_family_number(array)
    #['*', '3']
    start_val = array.first == '*' ? 1 : 0
    prime_count = (start_val..9).to_a
    prime_count.map { |n| (array.map { |x| x == '*' ?  n : x}.join.to_i) }
        .select { |n| Prime.prime? n}
end

# foo = [5, 6, '*', '*', 3]

# puts prime_family_number(foo)

# it's not going to be an even number
# or end in a 5
# or have wild cards at the end

def next_value_to_try(previous_val, tried_values)
    next_val = previous_val + 2
    if !Prime.prime?(next_val)
        next_value_to_try(next_val, tried_values)
    elsif tried_values.include?(next_val.to_s.split('').sort.join.to_i)
        next_value_to_try(next_val, tried_values)
    elsif next_val % 5 == 0
    # if next_val % 5 == 0
        next_value_to_try(next_val, tried_values)
    else
        next_val
    end
end

def swap_options(number)
    number_array = number.to_s.split('')
    # for 1 to length - 1 of array
    #     generate permutations for a number of * and x symbols
    #     replace x's with the original value
    swap_options_array = []
    (1..number_array.count - 1).to_a.each do |i|
        wildcards = ['*'] * i
        others = ['x'] * (number_array.count - i)
        permutations = (wildcards + others).permutation.to_a.select { |n| n.last != '*'}
        permutations.map! do |perm|
            perm.each_with_index.map { |n, i| n == '*' ? n : number_array[i].to_i }
        end
        permutations.uniq.each { |perm| swap_options_array << perm }
    end
    swap_options_array
end

def assess_number(number)
    options = swap_options(number)
    max = 0
    output = 0
    options.map do |option|
        prime_family = prime_family_number(option)
        if prime_family.count > max
            max = prime_family.count
            output = prime_family.first
        end
    end
    [max, output]
end

def find_prime_family_size(target_size, value = 1)
    result = []
    tried_values = []
    until result.first == target_size
        result = assess_number(value)
        tried_values << value.to_s.split('').sort.join.to_i
        value = next_value_to_try(value, tried_values)
    end
    result
end

start_time = Time.now
print find_prime_family_size(8)
puts ''
puts Time.now - start_time