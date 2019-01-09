class CreateIllustrations < ActiveRecord::Migration[5.2]
  def change
    create_table :illustrations do |t|
      t.string :illust_image
      t.string :illust_title
      t.string :illust_introduction
      t.text :evaluation_point
      t.integer :admin_id
      t.integer :user_id

      t.timestamps
    end
  end
end
