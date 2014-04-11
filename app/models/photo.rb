class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :location, presence: true

  belongs_to :user
  belongs_to :location
end
