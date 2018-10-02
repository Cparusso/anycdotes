class StoryReview < ApplicationRecord
  belongs_to :story
  belongs_to :review

end
