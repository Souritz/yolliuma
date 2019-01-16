class IllustrationTag < ApplicationRecord
  # 各モデル間のアソシエーション
  belongs_to :illustration
  belongs_to :tag_list
end
