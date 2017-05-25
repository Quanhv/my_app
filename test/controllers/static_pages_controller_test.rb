require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = 'My app is awesome applicction'
  end
  test "should get home" do
    get 'http://localhost:3000/static_pages/home'
    assert_response :success # :not_found, false
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test 'show get about' do
    get static_pages_about_url

    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
