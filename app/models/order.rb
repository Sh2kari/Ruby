class Order < ActiveRecord::Base
  belongs_to :weekday

  has_many :products, through: :order_products
  has_many :order_products, dependent: :destroy

  def total_price
    products.sum(:price)
  end
end
