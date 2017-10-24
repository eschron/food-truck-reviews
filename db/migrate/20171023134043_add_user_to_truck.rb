class AddUserToTruck < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :user_id, :integer, null: false
  end
end
