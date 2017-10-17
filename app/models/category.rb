class Category < ApplicationRecord
  has_many :categorizations
  has_many :trucks, through: :categorizations
  validates :cuisine, presence: true
end
