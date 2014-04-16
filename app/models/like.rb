class Like < ActiveRecord::Base

  validates_inclusion_of :score, in: [1]
  validates_uniqueness_of :user_id, scope: :photo_id

  belongs_to :user
  belongs_to :photo, counter_cache: true

end
