class Customer

attr_reader :name, :wallet, :drunkeness, :age

  def initialize(name, wallet, age, drunkeness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
  end

  def buy_drink(drink, pub)
    @wallet -= drink.price
    pub.increase_till(drink)
  end

  def increase_drunkeness(drink)
    @drunkeness += drink.abv 
  end

end
