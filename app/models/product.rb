class Product < ActiveRecord::Base
  belongs_to :weekday
  validates :title, :price, presence: true
end
