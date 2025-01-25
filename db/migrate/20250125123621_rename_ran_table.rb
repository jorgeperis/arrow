class RenameRanTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :rans, :run_marks
  end
end
