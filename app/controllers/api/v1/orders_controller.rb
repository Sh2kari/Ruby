class Api::V1::OrdersController < Api::V1::BaseController
  def index
    orders = Order.joins(:weekday).where(weekdays: { date: Date.today.at_beginning_of_week.strftime('%d %B %Y') }).all

    respond_with_success orders
  end
end
