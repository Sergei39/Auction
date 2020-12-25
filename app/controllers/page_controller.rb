class PageController < ApplicationController
  before_action :checking, only: %i[index, participation]
  skip_before_action :require_login, only: %i[index]

  def index
    @user = current_user
    @descriptions = Description.all
  end

  def profile
    @user = current_user
    @reviews = Review.where(:user_id => current_user.id)
    @user_rev = nil
    @user_rev = User.find(params[:id]) if (params[:id])
    @user_rev = nil if @user_rev == @user
    @reviews = Review.where(:user_id => @user_rev.id) unless @user_rev.nil?
  end

  def participation
    @user = current_user
    @descriptions = Description.all.select do |descr|
      descr.prod&.userr&.id == current_user.id || descr.buyer_id == current_user.id
    end
    # @descriptions = Description.where(:buyer_id => current_user.id || prod.user == @user)
  end

  def my_goods
    @user = current_user
    @products = Product.where(:user => @user.id).select do |prod|
      !prod.description.nil? && prod.description == 0
    end
    # @products = Product.where(:user => @user.id)
  end

  def add
    current_user.price = current_user.price + 10
    current_user.save
    redirect_to profile_path
  end

end
