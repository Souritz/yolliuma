class IllustrationTag < ApplicationRecord
  # モデルの使用凍結中
  # (使用する場合、illustrationsテーブルとtag_listテーブルの中間テーブルにする予定)
  ## 各モデル間のアソシエーション
  ## belongs_to :illustration
  ## belongs_to :tag_list
end
