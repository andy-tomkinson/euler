=begin
Starting in the top left corner of a 2×2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end

=begin
  
1x1 : 1 square : 2 routes
2x2 : 4 square : 6 routes
3x3 : 9 square : 20 routes
  
not a 2x2 grid but a 3x3 array

1x1 = 2x2 array:
  1,1 -> 1,2 -> 2,2
  1,1 -> 2,1 -> 2,2

each internal node can be reached from 2 nodes and can lead to 2 other nodes
each edge node can be reached from 1 node and can lead to 2 other nodes
each corner node can be reached form 1 node and can lead to exactly 1 node

1x1:
  internals: 0
  edges: 0
  corners: 2

2x2:
  internals: 1
  edges: 4
  corners: 2

3x3:
  internals: 4
  edges: 8
  corners: 2

=end

def pascal_row(row)
  ([0] + row).zip(row + [0]).collect { |a, b| a + b }
end

def central_binomial_coefficient(target)
  row = [1]
  (target * 2).times do
    row = pascal_row(row)    
  end
  row[(row.length - 1) / 2]
end

puts central_binomial_coefficient(20)