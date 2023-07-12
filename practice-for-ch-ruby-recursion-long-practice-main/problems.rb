require "byebug"
## Warmup


# - Write a recursive method, `range`, that takes a start and an end and returns
#   an array of all numbers in that range, exclusive. For example, `range(1, 5)`
#   should return `[1, 2, 3, 4]`. If `end < start`, return an empty array.
# - Write both a recursive and an iterative method to sum an array.

def range(x, y)
    new_arr = []
    (x...y).each do |el|
        new_arr << el
    end 

    new_arr


end 

def range(start, ending)
    return [] if ending == start
  
    [start] + range(start + 1, ending)
end
  
  
p range(1, 5)    # should return [1, 2, 3, 4]
puts 



# ## Exponentiation

# Write two versions of `exponent` that use two different recursions:
# # recursion 1

# def exp(b, e)
#     return 1 if e == 0

#     b * exp(b, e - 1)
# end


# p exp(b, 0) = 1
# p exp(b, n) = b * exp(b, n - 1)
# p exp(2, 0)    # 1
# p exp(2, 1)    # 1
# p exp(2, 2)    # 4 
# p exp(2, 3)    # 8
# puts 



# recursion 2

# def exp(b, n)
#     return 1 if n == 0

#     if n.even?
#         b * exp(b, n / 2) ** 2
#     else 
#         b * (exp(b, (n - 1) / 2) ** 2)
#     end 



# end 

def exp(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        rec = exp(b, n / 2)
        # debugger
        rec * rec
    else 
        rec = exp(b, (n - 1) / 2)
        b * rec * rec
    end 



end 

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

p exp(2, 0) #= 1
p exp(2, 1) #= b
p exp(2, 4) #= exp(b, n / 2) ** 2             [for even n]
p exp(2, 5) #= b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
puts 


def deep_dup(data)
    new_arr = [] 

    data.each do |el|
        if !el.is_a?(Array)
            new_arr << el 
        else 
            new_arr << deep_dup(el)
        end 
    end 



    new_arr
end 

p deep_dup([1, [2], [3, [4]]])
# p deep_dup([1, 2, 3])
puts 

def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
  
    seq = fib(n - 1)
    seq << seq[-1] + seq[-2]
end
  

p fib(1)     
p fib(2)
p fib(3)
p fib(10)
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,
puts 


def bsearch(arr, target)
    # debugger
    mid_idx = arr.length / 2 

    return nil if arr.length == 0
    return mid_idx if arr[mid_idx] == target

    if arr[mid_idx] > target
        bsearch(arr[0...mid_idx], target)
    else 
       res = bsearch(arr[mid_idx + 1..-1], target) 
        return nil if res.nil?
        res + mid_idx + 1
    end 
end 

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil