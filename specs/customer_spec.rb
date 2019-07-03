require('minitest/autorun')
require('minitest/rg')

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')

class TestCustomer < MiniTest::Test

  def setup
    @customer = Customer.new("Bob", 100)
    @drink1 = Drink.new("beer", 5)
    @drink2 = Drink.new("wine", 10)
    @drink3 = Drink.new("Cider", 7)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Queens Arms", 0, @drinks)
  end


def test_customer_name
  assert_equal("Bob", @customer.name)
end

def test_customer_wallet
  assert_equal(100, @customer.wallet)
end

def test_buy_drink
  @customer.buy_drink(@drink1, @pub)
  assert_equal(95, @customer.wallet())
  assert_equal(5, @pub.till())
end

end
