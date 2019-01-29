class TagList < ApplicationRecord
  # 各モデル間のアソシエーション
  belongs_to :illustration
  # has_many :illustration_tags, dependent: :destroy

  # 入力フォームに全項目入力させるためのvalidation
  validates :tag_name, presence: true
end
