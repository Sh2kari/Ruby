class Weekday < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :title, presence: true

  mount_uploader :cover, CoverUploader
end
