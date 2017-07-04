class Tag < ApplicationRecord
	has_many :taggings
	has_many :groups,		through: :taggings
end
