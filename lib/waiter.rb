require 'pry'
class Waiter

attr_accessor :name, :years

@all = []

def initialize(name, years) 
@name = name
@years = years
@@all << self
end

def self.all 
@@all 
end

def new_meal(customer, total, tip=0)
    Meal.new(self, customer,  total, tip=0)
end
def meals 
    # binding.pry
    Meal.all.select{|meal| meal.waiter == self}
end
def best_tipper 
    # binding.pry
   max_tip =  Meal.all.map{|meal| meal.tip}.max
  meal_instance = Meal.all.find{|meal| meal.tip ==  max_tip}
 meal_instance.customer
end

end