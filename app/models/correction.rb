class Correction < ApplicationRecord
  # 各モデル間のアソシエーション
  belongs_to :user
  belongs_to :illustration

  # refile gemで画像投稿可能にするための記述
  attachment :corrected_illust

end
