class OrderProductsController < ApplicationController
  before_action :set_order, only: :create

  def create
    product = Product.find(params[:product_id])
    @order_product = @order.order_products.build(product: product)

    if @order_product.save
      flash[:success] = 'Order was successfully created.'
      redirect_to root_path
    else
      flash[:error] = 'Order was not created.'
      redirect_to root_path
    end
  end

  private

  def weekday
    @weekday ||= Weekday.find(params[:weekday_id])
  end
  helper_method :weekday

  def set_order
    @order = weekday.orders.build
  end
end
