class ChangeTruckCol < ActiveRecord::Migration[5.1]
  def change
    rename_column :trucks, :locations_id, :location_id
  end
end
