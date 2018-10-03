class User < ApplicationRecord
  has_secure_password

  has_many :stories
  has_many :locations, through: :stories

  validates :username,
            :presence => true,
            :uniqueness => true
end
