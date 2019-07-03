require('minitest/autorun')
require('minitest/rg')

require_relative('../pub.rb')
require_relative('../drink.rb')

class TestPub < MiniTest::Test

  def setup()

    @drink1 = Drink.new("beer", 5)
    @drink2 = Drink.new("wine", 10)
    @drink3 = Drink.new("Cider", 7)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Queens Arms", 0, @drinks)

  end

  def test_pub_name
    assert_equal("Queens Arms", @pub.name)
  end

  def test_till
    assert_equal(0, @pub.till)
  end

  def test_pub_has_drinks
    assert_equal(3, @pub.has_drinks)
  end

  def test_increase_till
    @pub.increase_till(@drink1)
    assert_equal(5, @pub.till())
  end

end
