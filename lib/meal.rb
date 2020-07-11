class Meal
    attr_accessor :waiter, :customer, :total, :tip

@@all = []

def initialize(waiter, customer, total, tip)
@waiter = waiter
@customer = customer
@total = total
@tip = tip
@@all << self
end
    def self.find_customer_by_name(name)
        Meal.all.find{|mean| meal.customer == name}
    end

def self.all
    @@all
end

end