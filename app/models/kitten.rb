class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  belongs_to :user
  belongs_to :user, through: :bookings
  has_many :bookings
end
