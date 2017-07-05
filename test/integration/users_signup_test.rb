require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    # get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                  email: "user@invalid",
                                  password:
                                  "foo",
                                  password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_nil session[:user_id]
  end

  test "valid signup information" do
    # get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name: "user",
                                  email: "user@valid.com",
                                  password:
                                  "123456",
                                  password_confirmation: "123456" } }
    end

    assert_redirected_to User.last
    assert_not session[:user_id].nil?
  end
end
