---------------------
-- Day 2 exercices --
---------------------

-- easy
function concatenate(a1,a2)
   local result={}

   for _,v in ipairs(a1)  do
      result[#result+1]=v
   end

   for _,v in ipairs(a2)  do
      result[#result+1]=v
   end
   return result
end



local a1={1,2,3}
local a2={4,5,6}

dofile("util.lua")

print(table_to_string(concatenate(a1,a2)))


dofile("strict.lua")

treasure.gold=50

print(treasure.gold)

treasure.gold=nil


-- medium

-- a1 + a2 should concatenate tables
local mt = {
   __add = concatenate
}

setmetatable(a1,mt)

print("a1+a2")
print(table_to_string(a1+a2))



Queue = {

   items={},

   new=function(self)
      local obj={}
      setmetatable(obj,self)
      self.__index=self
      return obj
   end

}

function Queue:new()
   local obj={
      items={}
   }
   setmetatable(obj,self)
   self.__index=self
   return obj
end


function Queue:add(item)
   local _items = self.items
   self.items[#_items+1]=item
end


function Queue:remove()
   result = self.items[1]
   updated_items={}
   for i=2, #self.items do
      updated_items[#updated_items+1] = self.items[i]
   end
   self.items=updated_items
   return result
end



q=Queue:new()
q:add(1)
q:add(2)
q:add(3)

print("Queue items at the beginning : " .. #q.items)

print("Remove first input item :" .. q:remove())
print("Queue items size : " .. #q.items)

print("Remove second input item :" .. q:remove())
print("Queue items size : " .. #q.items)

print("Remove third input item :" .. q:remove())
print("Queue items size : " .. #q.items)

print("Remove nil item : " .. tostring(q:remove()))


-- hard


function retry (count, body)

   for i=1, count do
      local co = coroutine.create(body)

      local succeed, exception = coroutine.resume(co)
      if succeed and not exception then return end
      print("Error: ".. exception .. "; retrying")

   end
   print("gave up retrying")
end

math.randomseed(os.time())

retry(
   50,

   function()
      if math.random() > 0.2 then
         coroutine.yield('Something bad happened')
      end

      print('Succeeded')
   end
)
