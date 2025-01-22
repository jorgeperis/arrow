class AddRansCountToRaces < ActiveRecord::Migration[8.0]
  def change
    add_column :races, :rans_count, :integer, null: false, default: 0
  end
end
