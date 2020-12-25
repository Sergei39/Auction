require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { password: @user.password_digest,
                                        password_confirmation: @user.password_digest,
                                        price: @user.price, username: 'name' } }
    end

    assert_redirected_to home_url(User.last)
  end

end
