require('minitest/autorun')
require('minitest/rg')

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../food.rb')

class TestCustomer < MiniTest::Test

  def setup
    @customer = Customer.new("Bob", 100, 18, 0)
    @customer2 = Customer.new("Alice", 100, 18, 5)
    @drink1 = Drink.new("beer", 5, 1)
    @drink2 = Drink.new("wine", 10, 1)
    @drink3 = Drink.new("Cider", 7, 1)

    @stock = [{name: @drink1, stock: 10},
      {name: @drink2, stock: 10},
      {name: @drink3, stock: 10}]

    @pub = Pub.new("Queens Arms", 0, @stock)

    @food = Food.new("Pizza", 5, 1)
  end


  def test_customer_name
    assert_equal("Bob", @customer.name)
  end

  def test_customer_wallet
    assert_equal(100, @customer.wallet)
  end

  def test_buy_drink
    @customer.buy_drink(@drink1, @pub, @customer)
    assert_equal(95, @customer.wallet())
    assert_equal(5, @pub.till())
  end

  def test_age
    assert_equal(18, @customer.age)
  end

  def test_drunkeness
    assert_equal(0, @customer.drunkeness)
  end

  def test_increase_drunkeness
    @customer.increase_drunkeness(@drink1)
    assert_equal(1, @customer.drunkeness)
  end

  def test_eat_food_reduce_drunkeness
    @customer2.eat_food_reduce_drunkeness(@food)
    assert_equal(4, @customer2.drunkeness)
  end

  def test_reduce_stock_when_customer_buys_drink
    @pub.reduce_stock_when_customer_buys_drink(@drink1, @customer, @pub)
    assert_equal(29, @pub.total_stock)
    assert_equal(215, @pub.value_of_total_stock)
    assert_equal(5, @pub.till)
    assert_equal(95, @customer.wallet)
    assert_equal(1, @customer.drunkeness)
  end

end
