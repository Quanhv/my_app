require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    @admin = users(:admin)
    @other_user = users(:user2)
  end
  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    login_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "should delete user and redirect to users index" do
    login_as(@admin)
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
    assert_redirected_to users_url
  end
end
