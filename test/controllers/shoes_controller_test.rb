require "test_helper"

class ShoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoes = shoes(:one)
  end

  test "should get index" do
    get shoes_url
    assert_response :success
  end

  test "should get new" do
    get new_shoes_url
    assert_response :success
  end

  test "should create shoes" do
    assert_difference("Shoes.count") do
      post shoes_url, params: { shoes: { brand: @shoes.brand, distance: @shoes.distance, model: @shoes.model, price: @shoes.price, purchased_at: @shoes.purchased_at, retired_at: @shoes.retired_at, size: @shoes.size } }
    end

    assert_redirected_to shoes_url(Shoes.last)
  end

  test "should show shoes" do
    get shoes_url(@shoes)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoes_url(@shoes)
    assert_response :success
  end

  test "should update shoes" do
    patch shoes_url(@shoes), params: { shoes: { brand: @shoes.brand, distance: @shoes.distance, model: @shoes.model, price: @shoes.price, purchased_at: @shoes.purchased_at, retired_at: @shoes.retired_at, size: @shoes.size } }
    assert_redirected_to shoes_url(@shoes)
  end

  test "should destroy shoes" do
    assert_difference("Shoes.count", -1) do
      delete shoes_url(@shoes)
    end

    assert_redirected_to shoes_url
  end
end
