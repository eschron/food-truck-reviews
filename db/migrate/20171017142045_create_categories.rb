class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :cuisine, null: false

      t.timestamps
    end
  end
end
