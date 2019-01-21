class AddMyUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :my_user_id, :integer
  end
end
