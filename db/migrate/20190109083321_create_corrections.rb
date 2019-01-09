class CreateCorrections < ActiveRecord::Migration[5.2]
  def change
    create_table :corrections do |t|
      t.string :corrected_illust
      t.text :comment
      t.integer :user_id
      t.integer :illustration_id

      t.timestamps
    end
  end
end
