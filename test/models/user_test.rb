require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = User.new(username: 'Oda Nobunaga', password: '12345678')
    assert instance.save
  end

  test 'correct get' do
    instance = User.new(username: 'Isoroku Yamamoto', password: '12345678')
    assert_equal instance.username, 'Isoroku Yamamoto'
  end

  test 'correct destroy' do
    instance = User.new(username: 'Heitaro Kimura', password: '12345678')
    assert instance.destroy
  end

  test 'error not uniq email' do
    f_instance = User.new(username: 'Mmmm', password: '12345678')
    f_instance.save
    s_instance = User.new(username: 'Mmmm', password: '12345678')
    s_instance.validate
    assert_equal s_instance.errors[:username], ['has already been taken']
  end

  test 'error short password' do
    instance = User.new(username: 'Tateo Katō', password: '1')
    instance.validate
    assert_equal instance.errors[:password], ['is too short (minimum is 3 characters)']
  end

  test 'error name blank' do
    instance = User.new(password: '12345678')
    instance.validate
    assert_equal instance.errors[:username], ['can\'t be blank']
  end

  test 'error password blank' do
    instance = User.new(username: 'Shunji Sato')
    instance.validate
    assert_equal instance.errors[:password], ['can\'t be blank', 'is too short (minimum is 3 characters)']
  end
end
