class Tagging < ApplicationRecord
  belongs_to :group
  belongs_to :tag
  belongs_to :post
end
