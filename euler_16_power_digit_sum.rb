def power_digit_sum(power)
  (2 ** power).to_s.each_char.map { |c| c.to_i }.reduce(:+)
end

puts  power_digit_sum(1000)
