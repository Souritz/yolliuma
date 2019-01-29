class LikeUser < ApplicationRecord
  # 各モデル間のアソシエーション
  belongs_to :user
end
