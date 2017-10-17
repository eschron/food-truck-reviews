class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations do |t|
      t.belongs_to :category
      t.belongs_to :truck

      t.timestamps
    end
  end
end
