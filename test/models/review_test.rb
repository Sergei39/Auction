require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = Review.new(reviewer_id: 2, user_id: 1)
    assert instance.save
  end

  test 'correct get' do
    instance = Review.new(reviewer_id: 2, user_id: 1)
    assert_equal instance.reviewer_id, 2
  end

  test 'correct destroy' do
    instance = Review.new(reviewer_id: 2, user_id: 1)
    assert instance.destroy
  end
end
