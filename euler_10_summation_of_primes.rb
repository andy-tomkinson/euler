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

def sum_primes_by_max(num)
  (3..num).step(2).each do |x|
    @primes << x if prime?(x)
  end
  sum = 0
  @primes.each { |a| sum += a }
  puts sum
end

sum_primes_by_max(2_000_000)
puts @primes.length

#solved faster using Prime class - 142913828922
