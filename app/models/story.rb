class Story < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :story_tags
  has_many :tags, through: :story_tags
end
