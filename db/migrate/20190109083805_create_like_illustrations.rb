class CreateLikeIllustrations < ActiveRecord::Migration[5.2]
  def change
    create_table :like_illustrations do |t|
      t.integer :user_id
      t.integer :illustration_id

      t.timestamps
    end
  end
end
