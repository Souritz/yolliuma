class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 各モデル間のアソシエーション
  has_many :users, dependent: :destroy
  has_many :illustrations, dependent: :destroy
end
