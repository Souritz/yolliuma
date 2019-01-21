class AddMyUserIdToLikeUser < ActiveRecord::Migration[5.2]
  def change
    add_column :like_users, :my_user_id, :integer
  end
end
