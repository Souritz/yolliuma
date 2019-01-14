class Correction < ApplicationRecord
  # 各モデル間のアソシエーション
  belongs_to :user
  belongs_to :illustration
end
