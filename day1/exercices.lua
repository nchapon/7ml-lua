function hypotenuse(a,b)
   local a2 = a * a
   local b2 = b * b
   return math.sqrt(a2 + b2)
end

print("====================================")
print("Calcul hypotenuse = " .. hypotenuse(3,4))




function ends_with_3(num)
   return num % 10 == 3
end


print("===========================================")
print("ends_with_3(5) is " .. tostring(ends_with_3(5)))
print("ends_with_3(13) is " .. tostring(ends_with_3(13)))

function is_prime(num)
   for v = 2,num-1 do
      if num % v == 0 then
         return false
      end
   end
   return true
end

print("===========================================")
print("is_prime(1) is " .. tostring(is_prime(1)))
print("is_prime(2) is " .. tostring(is_prime(2)))
print("is_prime(3) is " .. tostring(is_prime(3)))
print("is_prime(4) is " .. tostring(is_prime(4)))
print("is_prime(5) is " .. tostring(is_prime(5)))
print("is_prime(6) is " .. tostring(is_prime(6)))
print("is_prime(13) is " .. tostring(is_prime(13)))



function first_prime_ends_with_3(n)

   local candidate = n
   local found = 0
   while (found < n) do
      if is_prime(candidate) and ends_with_3(candidate) then
         found=candidate
      end
      candidate=candidate+1
   end

   return found
end

print("===========================================")
print("First prime ends_with_3 after 8 will be : " .. first_prime_ends_with_3(8))
print("First prime ends_with_3 after 44 will be : " .. first_prime_ends_with_3(44))



function for_loop(a,b,f)

   while a <= b do
      f(a)
      a = a + 1
   end

end

print("===========================================")
for_loop(0,5, function(n)
    print(n * 2)
end)

function add(previous, next)
   return previous+next

end


function reduce (max,init, f)

   local intermediate = init

   while (init < max) do
      intermediate = f(intermediate,init +  1)
      init = init +1
   end

   return intermediate
end



print("reduce(5,0,add)=>" .. reduce(5,0,add))

function factorial(n)
   return reduce(n,1,function (a,b) return a * b end)
end


print("factorial(3) => " .. factorial(3))
print("factorial(5) => " .. factorial(5))
