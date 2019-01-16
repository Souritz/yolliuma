class RenameIllustImageToIllustrations < ActiveRecord::Migration[5.2]
  def change
    rename_column :illustrations, :illust_image, :illust_image_id
  end
end
