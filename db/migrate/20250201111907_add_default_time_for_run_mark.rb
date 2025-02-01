class AddDefaultTimeForRunMark < ActiveRecord::Migration[8.0]
  def change
    change_column_default :run_marks, :time, 0
  end
end
