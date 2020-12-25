require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test 'redirect to login' do
    get root_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end
