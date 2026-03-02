class SetDefaultUserId < ActiveRecord::Migration[8.0]
  def change
    Shoes.where(user_id: nil).update_all(user_id: User.first.id)

    change_column_null :shoes, :user_id, false
  end
end
