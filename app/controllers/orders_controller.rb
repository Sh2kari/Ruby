class OrdersController < ApplicationController
  def index
    @orders = weekday.orders
  end

  private

  def weekday
    @weekday ||= Weekday.find(params[:weekday_id])
  end
  helper_method :weekday
end

