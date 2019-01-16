class Illustration < ApplicationRecord
  # 各モデル間のアソシエーション
  has_many :like_illustrations, dependent: :destroy
  has_many :corrections, dependent: :destroy
  belongs_to :admin, optional: true
  belongs_to :user

  # 入力フォームに全項目入力させるためのvalidation
  validates :illust_title, presence: true
  validates :illust_introduction, presence: true
  validates :evaluation_point, presence: true

  # refile gemで画像投稿可能にするための記述
  attachment :illust_image

  # イラストを検索するための記述
  def self.search(search)
    if search
      # 文字列を含むイラストタイトルを取得
      Illustration.where(['illust_title LIKE ?', "%#{search}%"])
    else
      # 検索に引っかからない場合、イラストを全て表示する
      Illustration.all
    end
    
  end
end
