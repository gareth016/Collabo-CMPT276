class Membership < ApplicationRecord
  attr_accessor :user_id, :group_id
  belongs_to :group
  belongs_to :user
end
