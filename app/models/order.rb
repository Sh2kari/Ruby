class Order < ActiveRecord::Base
  belongs_to :weekday
  belongs_to :user

  has_many :products, through: :order_products
  has_many :order_products, dependent: :destroy

  def total_price
    products.sum(:price)
  end
end
