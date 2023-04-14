class FixDepartureTimeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :departure_time, :departure_time
  end
end
