class ProductsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource only: [:new, :create]

  def new
    @product = weekday.products.build
  end

  def create
    @product = weekday.products.build(product_params)

    if @product.save
      flash[:success] = 'Product was created.'
      redirect_to new_weekday_order_path
    else
      render :new
    end
  end

  private

  def weekday
    @weekday ||= Weekday.find(params[:weekday_id])
  end
  helper_method :weekday

  def product_params
    params.require(:product).permit(:title, :price, :category_id)
  end
end
