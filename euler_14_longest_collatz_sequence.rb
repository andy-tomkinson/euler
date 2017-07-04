=begin
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=end

def collatz_step(integer)
  if integer.even?
    integer / 2
  else
    3 * integer + 1
  end
end

def collatz_sequence(integer)
  sequence = []
  until integer == 1
    sequence << integer
    integer = collatz_step(integer)
  end
  sequence << integer
  sequence
end

def collatz_count(integer)
  collatz_sequence(integer).count
end

def max_collatz_count(limit)
  max = 0
  int = 0
  (1..limit).each do |integer|
    if max < collatz_count(integer)
      max = collatz_count(integer)
      int = integer
    end
  end
  int
end

puts max_collatz_count(1_000_000)
