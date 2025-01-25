class RenameRacesRansCountColumn < ActiveRecord::Migration[8.0]
  def change
    rename_column :races, :rans_count, :run_marks_count
  end
end
