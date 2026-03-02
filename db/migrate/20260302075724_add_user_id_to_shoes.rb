class AddUserIdToShoes < ActiveRecord::Migration[8.0]
  def up
    add_reference :shoes, :user, foreign_key: true
  end

  def down
   remove_reference :shoes, :user, foreign_key: true
  end
end
