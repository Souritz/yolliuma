class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 各モデル間のアソシエーション
  has_many :like_users, dependent: :destroy
  has_many :like_illustrations, dependent: :destroy
  has_many :corrections, dependent: :destroy
  has_many :illustrations, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :admin, optional: true

  # refile gemで画像投稿可能にするための記述
  attachment :user_image  
end
