class User < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :photos
  has_many :comments
  has_many :likes


end
