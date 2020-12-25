require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest

  test 'get home' do
    get home_path
    assert_response :success
  end

  test 'redirect to login with profile' do
    get profile_path
    assert_response :redirect
    assert_redirected_to login_path
  end

  test 'redirect to login with participation' do
    get participation_path
    assert_response :redirect
    assert_redirected_to login_path
  end

  test 'redirect to login with my_goods' do
    get my_goods_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end
