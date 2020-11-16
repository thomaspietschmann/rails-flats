class Flat < ApplicationRecord
  validates :name, :address, :price_per_night, :number_of_guests, presence: true
  has_many :bookings, dependent: :destroy
  has_many :clients, through: :bookings

end
