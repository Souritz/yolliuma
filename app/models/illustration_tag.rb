class IllustrationTag < ApplicationRecord
  belongs_to :illustration
  belongs_to :tag_list
end
