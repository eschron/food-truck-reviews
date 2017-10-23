class RemoveEmailFromTruck < ActiveRecord::Migration[5.1]
  def change
    remove_column :trucks, :email, :string
  end
end
