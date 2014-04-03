class Photo < ActiveRecord::Base
  validates :location, presence: true
  mount_uploader :image, ImageUploader

end
