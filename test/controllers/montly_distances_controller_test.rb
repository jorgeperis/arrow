require "test_helper"

class MontlyDistancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @montly_distance = montly_distances(:one)
  end

  test "should get index" do
    get montly_distances_url
    assert_response :success
  end

  test "should get new" do
    get new_montly_distance_url
    assert_response :success
  end

  test "should create montly_distance" do
    assert_difference("MontlyDistance.count") do
      post montly_distances_url, params: { montly_distance: { distance: @montly_distance.distance, month: @montly_distance.month, shoes_id: @montly_distance.shoes_id } }
    end

    assert_redirected_to montly_distance_url(MontlyDistance.last)
  end

  test "should show montly_distance" do
    get montly_distance_url(@montly_distance)
    assert_response :success
  end

  test "should get edit" do
    get edit_montly_distance_url(@montly_distance)
    assert_response :success
  end

  test "should update montly_distance" do
    patch montly_distance_url(@montly_distance), params: { montly_distance: { distance: @montly_distance.distance, month: @montly_distance.month, shoes_id: @montly_distance.shoes_id } }
    assert_redirected_to montly_distance_url(@montly_distance)
  end

  test "should destroy montly_distance" do
    assert_difference("MontlyDistance.count", -1) do
      delete montly_distance_url(@montly_distance)
    end

    assert_redirected_to montly_distances_url
  end
end
