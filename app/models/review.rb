class Review < ApplicationRecord
  has_many :story_reviews
  has_many :stories, through: :story_reviews
  validates :content, presence: :true


end
