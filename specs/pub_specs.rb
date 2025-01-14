require('minitest/autorun')
require('minitest/rg')

require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestPub < MiniTest::Test

  def setup()

    @drink1 = Drink.new("beer", 5, 1)
    @drink2 = Drink.new("wine", 10, 1)
    @drink3 = Drink.new("Cider", 7, 1)

    @stock = [{name: @drink1, stock: 10},
      {name: @drink2, stock: 10},
      {name: @drink3, stock: 10}]

    @pub = Pub.new("Queens Arms", 0, @stock)

    @customer = Customer.new("Bob", 100, 18, 0)
    @customer2 = Customer.new("Alice", 100, 17, 0)
    @customer3 = Customer.new("A", 100, 18, 10)

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


  def test_check_age
    assert_equal(18, @customer.age)
  end


  # def test_check_age_before_sale__pass
  #   @pub.check_age_before_sale(@customer, @drink1)
  #   assert_equal(5, @pub.till)
  #
  # end
  #
  # def test_check_age_before_sale__fail
  #   @pub.check_age_before_sale(@customer2, @drink1)
  #   assert_equal(0, @pub.till)
  #
  # end
  #
  # def test_check_drunkeness__pass
  #   @pub.check_drunkeness(@customer, @drink1)
  #   assert_equal(5, @pub.till)
  # end
  #
  # def test_check_drunkeness__fail
  #   @pub.check_drunkeness(@customer3, @drink1)
  #   assert_equal(0, @pub.till)
  # end

  def test_check_age_and_drunkeness__pass
    @pub.check_age_and_drunkeness(@customer, @drink1)
    assert_equal(5, @pub.till)
  end
  def test_check_age_and_drunkeness__too_young
    assert_equal("You're too young!", @pub.check_age_and_drunkeness(@customer2, @drink1))
  end
  def test_check_age_and_drunkeness__too_drunk
    assert_equal("You're too drunk!", @pub.check_age_and_drunkeness(@customer3, @drink1))
  end

  def test_total_stock
    assert_equal(30, @pub.total_stock)
  end

  def test_value_of_total_stock
    assert_equal(220, @pub.value_of_total_stock)
  end

  def test_decrease_stock
    assert_equal(29, @pub.decrease_stock(@drink1))
  end

  # def test_decrease_value_of_total_stock
  #   assert_equal(215, @pub.decrease_value(@drink1))
  # end

  def test_decrease_stock_and_value
    @pub.decrease_stock_and_value(@drink1)
    assert_equal(29, @pub.total_stock)
    assert_equal(215, @pub.value_of_total_stock)
  end




end
