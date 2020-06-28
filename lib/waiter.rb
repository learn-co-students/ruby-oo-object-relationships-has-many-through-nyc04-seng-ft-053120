require 'pry'
class Waiter
    attr_accessor :name, :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience

        @@all << self 
    end

    def self.all
        @@all 
    end

    #Meal.new(waiter, customer, total, tip)
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    #to get all the meals they have served
    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    #To find the best tipper
    def best_tipper
        best_tipped_meal = meals.max do |meal_a , meal_b|
            meal_a.tip <=> meal_b.tip 
        end
        best_tipped_meal.customer 
    end
end