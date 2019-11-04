class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  validates :email, uniqueness: true
end
