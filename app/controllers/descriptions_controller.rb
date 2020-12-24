class DescriptionsController < ApplicationController
  def new
    # проверяем принадлежит ли product пользователю
    product_id = params[:id]
    # render plain: params[:id].inspect

    if product_id.nil? || Product.find(product_id)&.user != current_user.id
      redirect_to home_path
    end

    @user = current_user

    @product = Product.find(product_id)
  end

  def create
    @description = Description.new(description_params)

    @description.save

    Product.(find(@description.product_id).description = true).save
    redirect_to participation_path
  end

  private def description_params
    params.require(:description).permit(:title, :text, :price, :time_end, :raise_by, :product)
  end

  def show
    @description = Description.find(params[:id])
  end

  def raise
    descr = Description.find_by(product: params[:id])
    last_buyer = descr.buyer
    if last_buyer != current_user
      last_buyer.price += descr.price unless last_buyer.nil?
      last_buyer.save unless last_buyer.nil?
      descr.price += descr.raise_by
      current_user.price -= descr.price
      descr.buyer_id = current_user.id

      descr.save
      current_user.save
    end
    redirect_to home_path
  end
end
