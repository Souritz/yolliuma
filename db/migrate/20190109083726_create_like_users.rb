class CreateLikeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :like_users do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
