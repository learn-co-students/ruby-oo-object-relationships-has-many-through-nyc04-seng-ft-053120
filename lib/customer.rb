
class Customer
  #customer class should know about every instance a
  #customer creates, there for we make @@all to store all the instances
attr_accessor :name, :age #will allow customer to change name or age, if we want to limit this: acc_reader
@@all = [] #where we will store all customer instances

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all #reader method for @@all (will display array of instances)
        @@all 
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def meals #this will allow customer to look at all the meals and only select the ones that belong to that customer.
        Meal.all.select do |meal|
            meal.customer == self
        #iterating through ALL meal instances
        #returning only the meals that pertain that customer, hence == self
        end
    end

    def waiters
        meals.map do |meal|
            meal.waiter
    #this will iterate through the customers meals, map over it, and return the waiter from each meal.
        end
    end

end