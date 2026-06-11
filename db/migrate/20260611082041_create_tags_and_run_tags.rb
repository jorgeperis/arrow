class CreateTagsAndRunTags < ActiveRecord::Migration[8.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :tags, [ :user_id, :name ], unique: true

    create_table :run_tags do |t|
      t.references :run, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end

    add_index :run_tags, [ :run_id, :tag_id ], unique: true
  end
end
