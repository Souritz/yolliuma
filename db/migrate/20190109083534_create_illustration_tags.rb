class CreateIllustrationTags < ActiveRecord::Migration[5.2]
  def change
    create_table :illustration_tags do |t|
      t.integer :illustration_id
      t.integer :tag_list_id

      t.timestamps
    end
  end
end
