class TagList < ApplicationRecord
  has_many: :illustration_tags, dependent: :destroy
end
