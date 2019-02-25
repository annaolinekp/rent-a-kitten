class Booking < ApplicationRecord
  validates :date, presence: true

  belongs_to :kitten
  belongs_to :user
end
