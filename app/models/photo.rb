class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :location, presence: true
end
