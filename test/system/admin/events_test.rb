require "application_system_test_case"

class Admin::EventsTest < ApplicationSystemTestCase
  setup do
    @admin_event = admin_events(:one)
  end

  test "visiting the index" do
    visit admin_events_url
    assert_selector "h1", text: "Admin/Events"
  end

  test "creating a Event" do
    visit admin_events_url
    click_on "New Admin/Event"

    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit admin_events_url
    click_on "Edit", match: :first

    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit admin_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
