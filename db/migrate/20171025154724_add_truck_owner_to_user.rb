class AddTruckOwnerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :truck_owner, :boolean, default: false
  end
end
