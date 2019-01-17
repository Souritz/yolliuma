class RenameCorrectedIllustColumnToCorrections < ActiveRecord::Migration[5.2]
  def change
    rename_column :corrections, :corrected_illust, :corrected_illust_id
  end
end
