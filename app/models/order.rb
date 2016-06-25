class Order < ActiveRecord::Base
  belongs_to :weekday
  has_many :order_products, dependent: :destroy
end
