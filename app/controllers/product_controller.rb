class ProductController < ApplicationController

  def new
    @user = current_user
  end

  def create
    # render plain: params[:product].inspect
    @product = Product.new(product_params)
    @product.user = current_user.id
    @product.description = false

    @product.save
    redirect_to my_goods_path
  end

  private def product_params
    params.require(:product).permit(:title, :text, :price)
  end

  # def show
  #   @product = Product.find(params[:id])
  # end
end
