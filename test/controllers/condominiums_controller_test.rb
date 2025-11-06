require 'test_helper'

class CondominiumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get condominiums_index_url
    assert_response :success
  end

  test "should get new" do
    get condominiums_new_url
    assert_response :success
  end

  test "should get edit" do
    get condominiums_edit_url
    assert_response :success
  end

  test "should get show" do
    get condominiums_show_url
    assert_response :success
  end

end
