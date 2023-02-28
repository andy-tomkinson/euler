=begin

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

=end

@calcs = 0

def next_integer_to_try(previous_int)
    nines = ([9] * previous_int.to_s.length).join.to_f
    if nines / previous_int < 6
        @calcs += 1
        (nines + 1).to_i
    # elsif
    #     (previous_int + 1).to_s.split('').uniq.count < 6
    #     next_integer_to_try(previous_int + 1)
    else
        @calcs += 1
        previous_int + 1
    end
end

def is_permutation?(original, multiple)
    multiplied = original * multiple
    original.to_s.split('').sort == multiplied.to_s.split('').sort
end

def highest_permutation(value, multiple = 2)
    is_permutation?(value, multiple) ? highest_permutation(value, multiple + 1) : multiple - 1
end

def lowest_permutation(value, multiple = 3)
    is_permutation?(value, multiple) ? highest_permutation(value, multiple - 1) : multiple
end

def find_target(target, starting_value = 125874)
    value = starting_value
    result = 0
    until result == target do
        old_val = value
        result = lowest_permutation(value)
        value = next_integer_to_try(value)
    end
    value
end

# puts highest_permutation(125874)
start_time = Time.now
puts find_target(1)
puts Time.now - start_time
puts @calcs

puts highest_permutation(128035)