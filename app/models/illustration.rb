class Illustration < ApplicationRecord
  has_many: :like_illustrations, dependent: :destroy
  has_many: :corrections, dependent: :destroy
  belongs_to :admin, optional: true
  belongs_to :user
end
