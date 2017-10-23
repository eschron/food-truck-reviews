class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates_inclusion_of :up_down, :in => [true, false]
end
