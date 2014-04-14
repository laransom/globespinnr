class Location < ActiveRecord::Base
  validates :name, presence: true

  has_many :photos
  has_many :comments, as: :commentable
end
