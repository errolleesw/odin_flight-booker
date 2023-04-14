class FixDepartureTimeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :depature_time, :departure_time
  end
end
