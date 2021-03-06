class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :reviews
  has_many :trucks
  has_many :votes

  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :last_name, presence: true
end
