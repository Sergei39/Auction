require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = Product.new(title: 'Product', text: 'Text', price: 10)
    assert instance.save
  end

  test 'correct get' do
    instance = Product.new(title: 'Product', text: 'Text', price: 10.5)
    assert_equal instance.title, 'Product'
  end

  test 'correct destroy' do
    instance = Product.new(title: 'Product', text: 'Text', price: 10)
    assert instance.destroy
  end

  test 'error price not num' do
    instance = Product.new(title: 'Product', text: 'Text', price: 'aaa')
    instance.validate
    assert_equal instance.errors[:price], ['is not a number']
  end

  test 'error title blank' do
    instance = Product.new(text: 'Text', price: 10)
    instance.validate
    assert_equal instance.errors[:title], ['can\'t be blank']
  end

  test 'error price blank' do
    instance = Product.new(title: 'Product', text: 'Text')
    instance.validate
    assert_equal instance.errors[:price], ['is not a number', 'can\'t be blank']
  end
end
