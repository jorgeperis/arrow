class CreateShoes < ActiveRecord::Migration[8.0]
  def change
    create_table :shoes do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.float :size, null: false
      t.date :purchased_at, null: false
      t.integer :distance, null: false, default: 0
      t.float :price
      t.date :retired_at
      t.timestamps
    end
  end
end
