class DescriptionsController < ApplicationController
  def new
    # проверяем принадлежит ли product пользователю
    id_product = params[:id]
    # render plain: params[:id].inspect

    if id_product.nil? || Product.find(id_product)&.user != current_user.id
      redirect_to home_path
    end

    @user = current_user

    @product = Product.find(id_product)
  end

  def create
    @description = Description.new(product_params)

    @description.save
    redirect_to participation_path
  end

  private def product_params
    params.require(:description).permit(:title, :text, :price, :time_end, :raise_by, :product)
  end

  def show
    @description = Description.find(params[:id])
  end
end
