class Waiter
attr_reader :name
@@all = []
    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def new_meal(customer, total, tip = 0)
        # meal takes:waiter, :customer, :total, :tip
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal_inst|
            meal_inst.waiter == self
        end
    end

    def best_tipper
        Meal.all.sort_by { |meal_inst| meal_inst.tip}.last.customer
    end
end