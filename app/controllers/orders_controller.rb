class OrdersController < ApplicationController
  def index
    @orders = weekday.orders
  end

  def new
    @products = weekday.products
    @order = weekday.orders.build
  end

  def create
    @products = weekday.products
    @order = weekday.orders.build(order_params)

    if @order.save
      flash[:success] = 'Order was created.'
      redirect_to root_path
    else
      flash[:error] = 'Order was not created.'
      render :new
    end
  end

  private

  def weekday
    @weekday ||= Weekday.find(params[:weekday_id])
  end
  helper_method :weekday

  def order_params
    params.require(:order).permit(product_ids: [])
  end
end
