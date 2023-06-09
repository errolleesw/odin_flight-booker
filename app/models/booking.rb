class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_bookings, foreign_key: :booking_id
  has_many :passengers, through: :passenger_bookings

  accepts_nested_attributes_for :passengers

  delegate :origin_name, :destination_name, :departure_time, to: :flight, prefix: true
end
