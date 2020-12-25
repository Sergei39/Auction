class ProductController < ApplicationController

  def new
  end

  def create
    # render plain: params[:product].inspect
    @product = Product.new(product_params)
    @product.user = current_user.id
    @product.description = false

    @product.save
    redirect_to @product
  end

  private def product_params
    params.require(:product).permit(:title, :text, :price)
  end

  def show
    @product = Product.find(params[:id])
  end
end
