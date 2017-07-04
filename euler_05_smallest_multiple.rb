x = 19

def mod20(another_number, iterator=20)
  another_number > 0 and iterator.downto(1).all? { |i| another_number % i == 0 }
end

#def mod20(another_number, iterator = 20)
#  unless iterator == 0
#    mod = another_number % iterator
#    if mod == 0
#      mod20(another_number, iterator -= 1)
#    else
#      return false
#    end
#    true
#  end
#end

until mod20(x) do x += 19 end

puts x
