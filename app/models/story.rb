class Story < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :story_tags, dependent: :destroy
  has_many :tags, through: :story_tags

  has_many :comments, dependent: :destroy

  validates :title,
            :presence => true,
            :uniqueness => true

  validates :content, presence: true
end
