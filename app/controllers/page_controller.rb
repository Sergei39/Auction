class PageController < ApplicationController
  def index
    @user = User.new
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
