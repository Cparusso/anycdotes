class User < ApplicationRecord
  has_many :stories
  has_many :locations, through: :stories

  validates :username,
            :presence => true,
            :uniqueness => true

  validates :username,
            :presence => true,

end
