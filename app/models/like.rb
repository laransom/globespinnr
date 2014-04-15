class Like < ActiveRecord::Base

  validates_inclusion_of :score, in: [1]

  belongs_to :user
  belongs_to :photo

end
