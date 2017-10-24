class Truck < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :reviews

  belongs_to :location
  belongs_to :user
end
