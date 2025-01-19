require "application_system_test_case"

class RansTest < ApplicationSystemTestCase
  setup do
    @ran = rans(:one)
  end

  test "visiting the index" do
    visit rans_url
    assert_selector "h1", text: "Rans"
  end

  test "should create ran" do
    visit rans_url
    click_on "New ran"

    fill_in "Date", with: @ran.date
    fill_in "Distance", with: @ran.distance
    fill_in "Edition", with: @ran.edition
    check "Homologated" if @ran.homologated
    fill_in "Race", with: @ran.race_id
    fill_in "Source", with: @ran.source
    fill_in "Time", with: @ran.time
    click_on "Create Ran"

    assert_text "Ran was successfully created"
    click_on "Back"
  end

  test "should update Ran" do
    visit ran_url(@ran)
    click_on "Edit this ran", match: :first

    fill_in "Date", with: @ran.date
    fill_in "Distance", with: @ran.distance
    fill_in "Edition", with: @ran.edition
    check "Homologated" if @ran.homologated
    fill_in "Race", with: @ran.race_id
    fill_in "Source", with: @ran.source
    fill_in "Time", with: @ran.time
    click_on "Update Ran"

    assert_text "Ran was successfully updated"
    click_on "Back"
  end

  test "should destroy Ran" do
    visit ran_url(@ran)
    click_on "Destroy this ran", match: :first

    assert_text "Ran was successfully destroyed"
  end
end
