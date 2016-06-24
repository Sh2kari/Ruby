class Weekday < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :title, presence: true

  mount_uploader :cover, CoverUploader
end
