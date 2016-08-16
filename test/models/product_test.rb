require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "product name", brand: "brand name",
      price: 10)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "brand should be present" do
    @product.brand = ""
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "price should be greater than 0" do
    @product.price = 0
    assert_not @product.valid?
    @product.price = 10
    assert @product.valid?
  end
end
