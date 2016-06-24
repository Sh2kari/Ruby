class Weekday < ActiveRecord::Base
  validates :title, presence: true

  mount_uploader :cover, CoverUploader
end
