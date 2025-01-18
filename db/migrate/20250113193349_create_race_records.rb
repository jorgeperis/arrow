class CreateRaceRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :rans do |t|
      t.references :race, null: false, foreign_key: true  # Add this line to create race_id column
      t.integer :edition
      t.date :date, null: false
      t.integer :distance, null: false
      t.boolean :homologated, null: false, default: false
      t.integer :time, null: false
      t.timestamps

      t.index [ :race_id, :edition ], unique: true
    end
  end
end
