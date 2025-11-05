require 'test_helper'

class AccessControlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get access_control_index_url
    assert_response :success
  end

  test "should get profiles" do
    get access_control_profiles_url
    assert_response :success
  end

  test "should get administrators" do
    get access_control_administrators_url
    assert_response :success
  end

  test "should get assignments" do
    get access_control_assignments_url
    assert_response :success
  end

end
