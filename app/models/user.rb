class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :bookings
  has_many :kittens

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
