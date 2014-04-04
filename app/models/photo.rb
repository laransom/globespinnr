class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :location, presence: true
  # validates :image, presence: true
  # validates_integrity_of :image
  # validates_processing_of :image

end
