json.extract! booking, :id, :flight_id, :num_passengers, :created_at, :updated_at
json.url booking_url(booking, format: :json)
