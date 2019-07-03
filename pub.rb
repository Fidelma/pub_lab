class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks || []

  end

  def has_drinks
    @drinks.size
  end

  def increase_till(drink)
    @till += drink.price
  end

# def check_age_before_sale(customer, drink)
#   if customer.age >= 18
#     increase_till(drink)
#   end
# end
#
# def check_drunkeness(customer,drink)
#   if customer.drunkeness < 10
#     increase_till(drink)
#   end
# end

def check_age_and_drunkeness(customer, drink)
  if customer.age >= 18 && customer.drunkeness < 10
    increase_till(drink)
  elsif customer.age < 18
    return "You're too young!"
  elsif customer.drunkeness >= 10
    return "You're too drunk!"
  end 
end

end
