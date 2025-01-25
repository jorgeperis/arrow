require "test_helper"

class RunMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @run_mark = run_marks(:one)
  end

  test "should get index" do
    get run_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_run_mark_url
    assert_response :success
  end

  test "should create run mark" do
    assert_difference("RunMark.count") do
      post run_marks_url, params: { run_mark: { date: @run_mark.date, distance: @run_mark.distance, edition: @run_mark.edition, homologated: @run_mark.homologated, race_id: @run_mark.race_id, source: @run_mark.source, time: @run_mark.time } }
    end

    assert_redirected_to run_mark_url(RunMark.last)
  end

  test "should show run mark" do
    get run_mark_url(@run_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_run_mark_url(@run_mark)
    assert_response :success
  end

  test "should update run mark" do
    patch run_mark_url(@run_mark), params: { run_mark: { date: @run_mark.date, distance: @run_mark.distance, edition: @run_mark.edition, homologated: @run_mark.homologated, race_id: @run_mark.race_id, source: @run_mark.source, time: @run_mark.time } }
    assert_redirected_to run_mark_url(@run_mark)
  end

  test "should destroy run mark" do
    assert_difference("RunMark.count", -1) do
      delete run_mark_url(@run_mark)
    end

    assert_redirected_to run_marks_url
  end
end
