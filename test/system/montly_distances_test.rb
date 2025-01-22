require "application_system_test_case"

class MontlyDistancesTest < ApplicationSystemTestCase
  setup do
    @montly_distance = montly_distances(:one)
  end

  test "visiting the index" do
    visit montly_distances_url
    assert_selector "h1", text: "Montly distances"
  end

  test "should create montly distance" do
    visit montly_distances_url
    click_on "New montly distance"

    fill_in "Distance", with: @montly_distance.distance
    fill_in "Month", with: @montly_distance.month
    fill_in "Shoes", with: @montly_distance.shoes_id
    click_on "Create Montly distance"

    assert_text "Montly distance was successfully created"
    click_on "Back"
  end

  test "should update Montly distance" do
    visit montly_distance_url(@montly_distance)
    click_on "Edit this montly distance", match: :first

    fill_in "Distance", with: @montly_distance.distance
    fill_in "Month", with: @montly_distance.month
    fill_in "Shoes", with: @montly_distance.shoes_id
    click_on "Update Montly distance"

    assert_text "Montly distance was successfully updated"
    click_on "Back"
  end

  test "should destroy Montly distance" do
    visit montly_distance_url(@montly_distance)
    click_on "Destroy this montly distance", match: :first

    assert_text "Montly distance was successfully destroyed"
  end
end
