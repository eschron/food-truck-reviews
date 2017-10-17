class Truck < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :email, presence: true

  has_many :categorizations
  has_many :categories, through: :categorizations

  has_many :reviews
  has_many :users, through: :reviews

  # belongs_to :locations
end
