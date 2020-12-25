require 'test_helper'

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  test 'redirect to login' do
    get new_description_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end
