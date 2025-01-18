class CreateMontlyDistance < ActiveRecord::Migration[8.0]
  def change
    create_table :montly_distances do |t|
      t.references :shoes, null: false, foreign_key: true
      t.date :month, null: false
      t.integer :distance, null: false, default: 0
      t.timestamps

      t.index [ :shoes_id, :month ], unique: true
    end
  end
end
