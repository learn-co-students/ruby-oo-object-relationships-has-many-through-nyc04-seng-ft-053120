require "pry"

class Waiter

  attr_reader :name
  attr_accessor :yrs_experience

  @@all = []

  def initialize(name,yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer,total,tip)
    Meal.new(self,customer,total,tip)
  end

  def meals
    Meal.all.select {|i| i.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end

  best_tipped_meal.customer
  end

end
