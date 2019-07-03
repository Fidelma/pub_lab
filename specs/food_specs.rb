require('minitest/autorun')
require('minitest/rg')

require_relative('../food.rb')


class TestFood < MiniTest::Test

  def setup()
    @food = Food.new("Pizza", 5, 1)
  end

  def test_name
    assert_equal("Pizza", @food.name)
  end

  def test_price
    assert_equal(5, @food.price)
  end

  def test_rejuv
    assert_equal(1, @food.rejuv)
  end

end
