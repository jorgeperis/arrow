class CreateDataSources < ActiveRecord::Migration[8.0]
  def change
    add_column :rans, :source, :string, null: false, default: 'chip'
  end
end
