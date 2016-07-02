class OrdersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource only: :index

  def index
    @orders = weekday.orders.includes(order_products: :product).includes(:user)
  end

  def new
    @products = weekday.products
    @order = weekday.orders.build
  end

  def create
    @order = weekday.orders.build(order_params)
    @order.user = current_user

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
