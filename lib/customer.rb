class Customer
    attr_reader :name, :age 

    @@all = []

    def initialize(name, age)
        @name = name 
        @age = age 

        @@all << self 
    end

    def self.all
        @@all
    end

    #Meal.new(waiter, customer, total, tip)
    def new_meal(waiter, total, tip = 0)
        Meal.new(waiter, self, total, tip)
    end

    #to get a specific customer meals
    def meals
        Meal.all.select do |meal|
            meal.customer == self 
        end
    end

    #to get a specid customer waiters
    def waiters
        meals.map do |meal|
          meal.waiter
        end
      end

      # to find the name of his last waiter
      #terrance.waiters.last.name #=> "Yomi"
      
end