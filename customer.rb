class Customer

attr_reader :name, :wallet, :drunkeness, :age

  def initialize(name, wallet, age, drunkeness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
  end

  def buy_drink(drink, pub, customer)
    pub.check_age_and_drunkeness(customer, drink)
    @wallet -= drink.price
  end

  def increase_drunkeness(drink)
    @drunkeness += drink.abv
  end

  def eat_food_reduce_drunkeness(food)
    @drunkeness -= food.rejuv
  end

  def reduce_stock_when_customer_buys_drink(drink, customer, pub)
    customer.buy_drink(drink, pub, customer)
    customer.increase_drunkeness(drink)
    pub.decrease_stock_and_value(drink)
  end



end
