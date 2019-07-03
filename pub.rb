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


end
