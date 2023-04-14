json.extract! flight, :id, :flight_number, :airline_id, :origin_id, :destination_id, :departure_time, :arrival_time,
              :duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
