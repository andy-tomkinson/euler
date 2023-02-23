=begin

The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

=end

def triangle_number?(num)
    triangle_numbers(100).include?(num)
end

def triangle_numbers(terms)
    triangle_numbers = []
    (1..terms).each do |n|
        triangle_numbers << ((0.5 * n) * (n + 1)).to_i
    end
    triangle_numbers
end

def word_to_number(word)
    sum = 0
    word.downcase.each_byte do |byte|
        sum += byte - 96
    end
    sum
end

def triangle_word?(word)
    triangle_number?(word_to_number(word))
end

words = File.read('./euler_42_words.txt').gsub('"', '').split(',')

count = words.select { |word| triangle_word?(word) }.length

p count