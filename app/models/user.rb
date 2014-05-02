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

  def most_liked
    photos.where("likes_count IS NOT NULL").order(likes_count: :desc).limit(5)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(10)
  end

  def places_visited
    visited = []
    photos.each do |photo|
      unless visited.include?(photo.location)
        visited << photo.location
      end
    end
    visited
  end

  def is_admin?
    role == 'admin'
  end
end
