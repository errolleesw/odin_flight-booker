class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_bookings, foreign_key: :booking_id
end
