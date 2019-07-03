require('minitest/autorun')
require('minitest/rg')

require_relative('../drink.rb')

class TestDrink < MiniTest::Test

  def  setup
    @drink = Drink.new("Beer", 5)
  end

  def test_drink_name
    assert_equal("Beer", @drink.name())
  end

  def test_drink_price
    assert_equal(5, @drink.price())
  end




end
