require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get delivery" do
    get static_pages_delivery_url
    assert_response :success
  end

  test "should get return" do
    get static_pages_return_url
    assert_response :success
  end

  test "should get about_us" do
    get static_pages_about_us_url
    assert_response :success
  end

end
