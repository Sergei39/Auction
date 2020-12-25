class ApplicationController < ActionController::Base
  include SessionHelper
  include PageHelper

  before_action :require_login

  private

  def require_login
    unless signed_in?
      flash[:danger] = 'Need login'
      redirect_to login_path
    end
  end

  def checking
    Description.all.each do |descr|
      if (left_time descr.time_end) <= 0
        prod = descr.prod # у product теперь нет description
        prod.description = 0
        prod.price = descr.price unless descr.buyer_id.nil?
        prod.save

        user = descr.prod.userr
        user.price += descr.price unless descr.buyer_id.nil? # переводим деньги продавцу
        user.save unless descr.buyer_id.nil?


        prod.user = descr.buyer_id unless descr.buyer_id.nil? # делаем нового хозяина товара
        prod.save unless descr.buyer_id.nil?

        descr.delete
      end
    end
  end
end
