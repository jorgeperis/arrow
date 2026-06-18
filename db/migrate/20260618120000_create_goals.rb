class CreateGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.float :distance, null: false
      t.integer :target_time, null: false

      t.timestamps
    end

    add_index :goals, [ :user_id, :distance ], unique: true
  end
end
