require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest

  def setup
    post users_path, params: { user: { username: 'Sergei', password: '12345678', password_confirmation: '12345678' } }
    post session_path, params: { username: 'Sergei', password: '12345678' }
    post '/product', params: { product: { title: "Товар 1", text: "Текст этого товара", price: '10' } }
    @id = Product.find_by(title: "Товар 1").id
  end

  test 'correct profile to' do
    get profile_path
    assert_response :success
  end
  #
  test 'correct add price' do
    get add_path
    assert_equal User.find_by(username: 'Sergei').price, 10
  end

  test 'correct my_goods to' do
    get my_goods_path
    assert_response :success
  end
end