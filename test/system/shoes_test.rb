require "application_system_test_case"

class ShoesTest < ApplicationSystemTestCase
  setup do
    @shoes = shoes(:one)
  end

  test "visiting the index" do
    visit shoes_url
    assert_selector "h1", text: "Shoes"
  end

  test "should create shoes" do
    visit shoes_url
    click_on "New shoes"

    fill_in "Brand", with: @shoes.brand
    fill_in "Distance", with: @shoes.distance
    fill_in "Model", with: @shoes.model
    fill_in "Price", with: @shoes.price
    fill_in "Purchased at", with: @shoes.purchased_at
    fill_in "Retired at", with: @shoes.retired_at
    fill_in "Size", with: @shoes.size
    click_on "Create Shoes"

    assert_text "Shoes was successfully created"
    click_on "Back"
  end

  test "should update Shoes" do
    visit shoes_url(@shoes)
    click_on "Edit this shoes", match: :first

    fill_in "Brand", with: @shoes.brand
    fill_in "Distance", with: @shoes.distance
    fill_in "Model", with: @shoes.model
    fill_in "Price", with: @shoes.price
    fill_in "Purchased at", with: @shoes.purchased_at
    fill_in "Retired at", with: @shoes.retired_at
    fill_in "Size", with: @shoes.size
    click_on "Update Shoes"

    assert_text "Shoes was successfully updated"
    click_on "Back"
  end

  test "should destroy Shoes" do
    visit shoes_url(@shoes)
    click_on "Destroy this shoes", match: :first

    assert_text "Shoes was successfully destroyed"
  end
end
