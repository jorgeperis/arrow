class RemovePriceFromShoes < ActiveRecord::Migration[8.0]
  def change
    remove_column :shoes, :price, :float
  end
end
