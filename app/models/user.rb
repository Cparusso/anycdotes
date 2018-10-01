class User < ApplicationRecord
  has_many :stories
  has_many :locations, through: :stories
end
