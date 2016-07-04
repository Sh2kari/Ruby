class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price

  has_one :user
  has_many :products
end
