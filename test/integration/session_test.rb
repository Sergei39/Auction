require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should reg and log' do
    post users_path, params: { user: { username: 'Sergei', password: '12345678', password_confirmation: '12345678' } }
    assert_response :redirect
    assert_redirected_to home_path
    post session_path, params: { username: 'Sergei', password: '12345678' }
    assert_response :redirect
    assert_redirected_to home_path
  end

  test 'should logout' do
    post users_path, params: { user: { username: 'Sergei', password: '12345678', password_confirmation: '12345678' } }
    post session_path, params: { username: 'Sergei', password: '12345678' }
    get logout_path
    assert_response :redirect
    assert_redirected_to '/session/login'
  end
end