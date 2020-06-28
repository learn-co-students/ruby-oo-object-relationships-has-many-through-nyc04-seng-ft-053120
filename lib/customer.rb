require "pry"

class Customer

  attr_reader :name
  attr_accessor :age

  @@all=[]

  def initialize(name,age)
    @name = name
    @age = age
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter,total,tip)
    Meal.new(waiter,self,total,tip)
  end

  def meals
    Meal.all.select {|i| i.customer == self}
  end

  def waiters
    meals.map {|i| i.waiter}
  end

end
