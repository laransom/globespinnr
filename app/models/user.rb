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


  def full_name
    first_name + ' ' + last_name
  end

  def self.most_liked(user)
    user.photos.order(likes_count: :desc).limit(5)
  end

  def self.recent_comments(user)
    user.comments.order(created_at: :desc).limit(10)
  end
end
