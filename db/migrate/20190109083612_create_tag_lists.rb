class CreateTagLists < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_lists do |t|
      t.string :tag_name

      t.timestamps
    end
  end
end
