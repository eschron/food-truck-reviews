class Location < ApplicationRecord
  validates :body, presence: true
  # has_many :trucks
end