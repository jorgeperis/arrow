require "application_system_test_case"

class RunMarkssTest < ApplicationSystemTestCase
  setup do
    @run_mark = run_marks(:one)
  end

  test "visiting the index" do
    visit run_mark_url
    assert_selector "h1", text: "Run marks"
  end

  test "should create run mark" do
    visit run_mark_url
    click_on "New run mark"

    fill_in "Date", with: @run_mark.date
    fill_in "Distance", with: @run_mark.distance
    fill_in "Edition", with: @run_mark.edition
    check "Homologated" if @run_mark.homologated
    fill_in "Race", with: @run_mark.race_id
    fill_in "Source", with: @run_mark.source
    fill_in "Time", with: @run_mark.time
    click_on "Create Run mark"

    assert_text "Run mark was successfully created"
    click_on "Back"
  end

  test "should update Run mark" do
    visit run_mark_url(@run_mark)
    click_on "Edit this run mark", match: :first

    fill_in "Date", with: @run_mark.date
    fill_in "Distance", with: @run_mark.distance
    fill_in "Edition", with: @run_mark.edition
    check "Homologated" if @run_mark.homologated
    fill_in "Race", with: @run_mark.race_id
    fill_in "Source", with: @run_mark.source
    fill_in "Time", with: @run_mark.time
    click_on "Update Run mark"

    assert_text "Run mark was successfully updated"
    click_on "Back"
  end

  test "should destroy Run mark" do
    visit run_mark_url(@run_mark)
    click_on "Destroy this run mark", match: :first

    assert_text "Run mark was successfully destroyed"
  end
end
