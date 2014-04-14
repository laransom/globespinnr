class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :image, presence: true

  belongs_to :user
  belongs_to :location
  has_many :comments, as: :commentable
end
