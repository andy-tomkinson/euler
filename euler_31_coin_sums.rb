=begin
  
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
  
=end

=begin
  
1p : [1]              1
2p : [2][1,1]         2
5p : [5],[2,2,1]      2
10p: [10],[5,5]       2
20p: [20],[10,10]     2
50p: [50],[20,20,10]  2
£1 : [100],[50,50]    2
£2 : [200],[100,100]  2
  
=end

1

2
1 1

5
2 2 1
2 1 1 1
1 1 1 1 1

10
5 5
5 2 2 1
5 2 1 1 1   
5 1 1 1 1 1
2 2 2 2 2             # not from 5 5
2 2 2 2 1 1
2 2 2 1 1 1 1
2 2 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1

1 + 1
1 + 2 + 1
1 + 4 + 3 + 2 + 1 + 1 - 1 # overlap

1 + 11 + 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1
1 + 11 + 11 + 11 + 11 + 11 + 11
1 + 66 - overlap