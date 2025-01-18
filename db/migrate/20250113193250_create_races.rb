class CreateRaces < ActiveRecord::Migration[8.0]
  def change
    create_table :races do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.integer :distance, null: false
      t.boolean :homologated, null: false, default: false
      t.timestamps

      t.index [ :name, :distance, :location ], unique: true
    end
  end
end
