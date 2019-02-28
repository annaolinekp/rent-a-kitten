class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  belongs_to :user
  has_many :bookings
  has_many :reviews

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader
end
