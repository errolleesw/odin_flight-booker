class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.references :airline, null: false, foreign_key: true
      t.references :origin, null: false, foreign_key: { to_table: :airports }
      t.references :destination, null: false, foreign_key: { to_table: :airports }
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :duration

      t.timestamps
    end
  end
end
