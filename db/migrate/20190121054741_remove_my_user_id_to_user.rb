class RemoveMyUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :my_user_id, :integer
  end
end
