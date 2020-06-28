require 'pry'
class Customer
attr_accessor :name, :age
@@all = []
  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def new_meal(waiter, total, tip = 0)
# meal takes:waiter, :customer, :total, :tip
    Meal.new(waiter, self, total, tip )
  end

  def meals
    Meal.all.select do |meal_instance|
        meal_instance.customer == self
    end
  end
  
  def waiters
     self.meals.map do |meal_instance|
         meal_instance.waiter
     end
  end
end