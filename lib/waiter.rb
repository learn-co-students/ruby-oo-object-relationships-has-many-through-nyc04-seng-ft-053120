class Waiter
    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def find_highest_tipper
        meals.max_by do |meal|
            meal.tip
        end
    end

    def best_tipper
        find_highest_tipper.customer
    end
end