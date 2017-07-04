require 'Prime'

@primes = [2]

def prime?(num)
  prime = true
  @primes.each do |n|
    if (num % n).zero?
      prime = false
      break
    end
  end
  prime
end

def find_prime(num)
  x = 3
  until @primes.length == num
    @primes << x if prime?(x)
    x += 2
  end
  puts @primes[num - 1]
end
