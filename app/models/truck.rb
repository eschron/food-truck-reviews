class Truck < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :email, presence: true

  # belongs_to :locations
end
