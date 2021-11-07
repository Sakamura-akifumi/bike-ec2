require 'test_helper'

class Admin::BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bikes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_bikes_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_bikes_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bikes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_bikes_update_url
    assert_response :success
  end

  test "should get create" do
    get admin_bikes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_bikes_destroy_url
    assert_response :success
  end
end
