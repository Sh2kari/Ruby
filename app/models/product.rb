class Product < ActiveRecord::Base
  belongs_to :weekday
  belongs_to :category
  validates :title, :price, presence: true
end
