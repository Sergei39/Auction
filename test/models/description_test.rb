require 'test_helper'

class DescriptionTest < ActiveSupport::TestCase
  # :title, :text, :price, :time_end, :raise_by, :product
  test 'correct save' do
    instance = Description.new(text: 'Text', price: 10, raise_by: 2.2, product: 1)
    assert instance.save
  end

  test 'correct get' do
    instance = Description.new(text: 'Text', price: 10, raise_by: 2.2, product: 1)
    assert_equal instance.text, 'Text'
  end

  test 'correct destroy' do
    instance = Description.new(text: 'Text', price: 10, raise_by: 2.2, product: 1)
    assert instance.destroy
  end

  test 'error price not num' do
    instance = Description.new(text: 'Text', price: 'gf', raise_by: 2.2, product: 1)
    instance.validate
    assert_equal instance.errors[:price], ['is not a number']
  end

  test 'error raise_by not num' do
    instance = Description.new(text: 'Text', price: 10, raise_by: 'as', product: 1)
    instance.validate
    assert_equal instance.errors[:raise_by], ['is not a number']
  end

  test 'error price blank' do
    instance = Description.new(text: 'Text', raise_by: 2, product: 1)
    instance.validate
    assert_equal instance.errors[:price], ['is not a number', 'can\'t be blank']
  end

  test 'error raise_by blank' do
    instance = Description.new(text: 'Text', price: 2, product: 1)
    instance.validate
    assert_equal instance.errors[:raise_by], ['is not a number', 'can\'t be blank']
  end
end
