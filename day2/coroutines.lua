-- coroutines always starts in paused state

function fibonacci()
   local m = 1
   local n = 1

   -- no return value, instead yields to the caller
   while true do
      coroutine.yield(m)
      m,n = n, m+n
   end

end



generator = coroutine.create(fibonacci)

-- resume runs program until yield
for i=0,5 do
   succeed, value = coroutine.resume(generator)
   print("value :" .. value)
end
