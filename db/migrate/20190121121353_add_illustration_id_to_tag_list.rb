class AddIllustrationIdToTagList < ActiveRecord::Migration[5.2]
  def change
    add_column :tag_lists, :illustration_id, :integer
  end
end
