class Like < ActiveRecord::Base

  validates_inclusion_of :score, in: [1]

  belongs_to :user
  belongs_to :photo, counter_cache: :count_of_likes

end
