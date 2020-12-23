class DescriptionsController < ApplicationController
  def new
  end

  def create
    # render plain: params[:product].inspect
    @description = Description.new(product_params)

    @description.save
    redirect_to @description
  end

  private def product_params
    params.require(:product).permit(:title, :text, :price, :time_end, :raise_by)
  end

  def show
    @description = Description.find(params[:id])
  end
end
