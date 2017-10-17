class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :description
      
      t.belongs_to :truck
      t.belongs_to :user

      t.timestamps
    end
  end
end
