require 'test_helper'

class User::BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_bikes_index_url
    assert_response :success
  end

  test "should get show" do
    get user_bikes_show_url
    assert_response :success
  end

end
