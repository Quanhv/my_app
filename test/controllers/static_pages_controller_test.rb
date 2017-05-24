require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get 'http://localhost:3000/static_pages/home'
    assert_response :success # :not_found, false
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test 'show get about' do
    get static_pages_about_url

    assert_response :success
  end
end
