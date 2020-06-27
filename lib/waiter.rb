class Waiter
    attr_accessor :name,:experience
    @@all=[]
    def initialize(name,experience)
        @name=name
        @experience=experience
        @@all<<self
    end

    def new_meal(customer,total,tip)
        new_meal=Meal.new(self,customer,total,tip)
    end
    def meals
        Meal.all.select {|meal| meal.waiter==self}
    end
    def best_tipper
        best_tipper=nil
        max_tip=0
        Meal.all.each do |meal|
            if meal.tip>max_tip
                max_tip=meal.tip
                best_tipper=meal.customer
            end
        end
        best_tipper
    end








    def self.all
        @@all
    end








end