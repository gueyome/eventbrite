require 'test_helper'

class Admin::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_event = admin_events(:one)
  end

  test "should get index" do
    get admin_events_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_event_url
    assert_response :success
  end

  test "should create admin_event" do
    assert_difference('Admin::Event.count') do
      post admin_events_url, params: { admin_event: {  } }
    end

    assert_redirected_to admin_event_url(Admin::Event.last)
  end

  test "should show admin_event" do
    get admin_event_url(@admin_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_event_url(@admin_event)
    assert_response :success
  end

  test "should update admin_event" do
    patch admin_event_url(@admin_event), params: { admin_event: {  } }
    assert_redirected_to admin_event_url(@admin_event)
  end

  test "should destroy admin_event" do
    assert_difference('Admin::Event.count', -1) do
      delete admin_event_url(@admin_event)
    end

    assert_redirected_to admin_events_url
  end
end
