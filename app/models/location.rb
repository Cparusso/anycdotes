class Location < ApplicationRecord
  has_many :stories
  has_many :users, through: :stories
end
