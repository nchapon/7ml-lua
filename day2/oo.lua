dietrich = {
   name="Dietrich",
   health=100,

   take_hit = function(self)
      self.health=self.health-10
   end
}



Villain = {
   health=100,

   new = function(self,name)
      local obj ={
         name=name,
         health=self.health
      }

      -- delegate field look up to the Villain prototype
      setmetatable(obj,self)
      self.__index=self
      return obj
   end,

   take_hit = function(self)
      self.health=self.health-10
   end
}


dietrich = Villain.new(Villain,"dietrich")
dietrich.take_hit(dietrich)
print("Health Dietrich after hit :" .. dietrich.health)


SuperVillain = Villain.new(Villain)


function SuperVillain.take_hit(self)
   self.health=self.health-5
end

toth = SuperVillain.new(SuperVillain,"Toth")
toth.take_hit(toth)
print("Health Toth after hit :" .. toth.health)


-- WITH SYNTAXIC SUGAR

Villain={
   health=100
}


function Villain:new(name)
   local obj ={
      name=name,
      health=self.health
   }

   -- delegate field look up to the Villain prototype
   setmetatable(obj,self)
   self.__index=self
   return obj

end


function Villain:take_hit()
   self.health =  self.health - 10
end

SuperVillain = Villain:new()

function SuperVillain:take_hit()
   self.health = self.health - 5
end
