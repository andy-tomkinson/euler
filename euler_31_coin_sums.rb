=begin
  
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
  
=end

@coins = [200, 100, 50, 20, 10, 5, 2, 1]

def coin_permutations_to_make(target, coins = @coins)
    permutations = 0
    coins.select { |x| x <= target }.each do |current_largest|
        p "for #{current_largest}p"
        if current_largest == 1
            p "I will use #{target} pennies to fill it up"
            p '---'
            permutations += 1
        else
            (target / current_largest).downto(1) do |num_of_largest|
                value = current_largest * num_of_largest
                if value == target
                    p "#{num_of_largest} x #{current_largest} is #{value} so I'm happy"
                    p '---'
                    permutations += 1
                elsif value.between?(1, target)
                    p "#{num_of_largest} x #{current_largest} is #{value}, aiming for #{target}"
                    permutations += coin_permutations_to_make(target - value, coins.select { |x| x < current_largest })
                end
            end
        end
    end
    permutations
end

p coin_permutations_to_make(200)