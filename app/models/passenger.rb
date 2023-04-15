class Passenger < ApplicationRecord
  has_many :passenger_bookings, foreign_key: :passenger_id
end
