# class User
#   def initialize()
#     @nick_name = 'Sergei'
#     @price = 497.to_s
#   end
#
#   # аватарка
#   attr_reader :nick_name
#   attr_accessor :price
# end

class Review
  def initialize()
    @text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    @date = '18.12.2020'
  end

  # ссылка на того кто оставил отзыв
  attr_accessor :text
  attr_accessor :date
end

class DescriptionProduct
  def initialize()
    @title = 'My best good'
    @text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    @left_time = '0:2:47'
    @price = 1.to_s
    @raise_by = 0.01.to_s
    @buyer = 'you'
  end

  # ссылка на продавца
  attr_reader :title
  attr_reader :text
  attr_reader :left_time
  attr_reader :price
  attr_reader :raise_by
  attr_reader :buyer # имя текущего покупателя
end


class PageController < ApplicationController
  include SessionHelper

  def index
    @user = current_user
    @descriptions = Array.new(6){ |elem| DescriptionProduct.new() }
  end

  def profile
    @user = User.new
    @reviews = Array.new(6){ |elem| Review.new() }
  end

  def participation
    @user = User.new
    @descriptions = Array.new(6){ |elem| DescriptionProduct.new() }
  end

  def my_goods
    @user = User.new
    @products = Product.all
  end
end
