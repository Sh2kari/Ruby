class Product < ActiveRecord::Base
  belongs_to :weekday
  belongs_to :category
  has_many :order_products

  validates :title, :price, presence: true
end
