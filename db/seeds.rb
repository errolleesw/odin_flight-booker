# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'open-uri'

airports_file_path = Rails.root.join('db', 'csv', 'airports.csv')

CSV.foreach(airports_file_path) do |row|
  Airport.create!(code: row[4], name: row[1])
end

airlines_file_path = Rails.root.join('db', 'csv', 'airlines.csv')

CSV.foreach(airlines_file_path) do |row|
  Airline.create!(code: row[3], name: row[1])
end

flight_file_path = Rails.root.join('db', 'csv', 'flights.csv')
system("curl 'https://api.mockaroo.com/api/b33aa150?count=1000&key=a55d8670' > #{flight_file_path}")

CSV.foreach(flight_file_path, headers: true) do |row|
  origin_airport = Airport.find_by(id: row['origin_id'])
  destination_airport = Airport.find_by(id: row['destination_id'])

  Flight.create!(
    flight_number: row['flight_number'],
    airline_id: row['airline_id'],
    # origin: row['origin_id'],
    # destination: row['destination_id'],
    origin: origin_airport,
    destination: destination_airport,
    departure_time: row['departure_time'],
    arrival_time: row['arrival_time'],
    duration: row['duration']
  )
end
