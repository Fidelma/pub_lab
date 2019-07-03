class Pub

  attr_reader :name, :till

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock

  end

  def has_drinks
    @stock.length
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

def total_stock
  total = 0
    for drink in @stock
      total += drink[:stock]
    end
    return total

end

def value_of_total_stock
  total_value = 0
  for drink in @stock
    total_value += (drink[:name].price * drink[:stock])
  end
  return total_value
end

  def decrease_stock(drink)
    total = 0
    for item in @stock
      if item[:name] == drink
      total += (item[:stock] -= 1)
    else
      total += item[:stock]
    end
  end
    return total
  end

  def decrease_stock_and_value(drink)
    decrease_stock(drink)
    value_of_total_stock
  end 




end
