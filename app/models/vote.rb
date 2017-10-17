class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :up_down, presence: true
end
