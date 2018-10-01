class Tag < ApplicationRecord
  has_many :storytags
  has_many :stories, through: :storytags
end
