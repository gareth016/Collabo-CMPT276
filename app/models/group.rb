class Group < ApplicationRecord
	has_many :memberships, 	dependent: :destroy
	has_many :users, 		through: :memberships

	has_many :taggings
	has_many :tags, 		through: :taggings 

	has_many :posts

	def all_tags=(names)
		self.tags = names.split(",").map do |name|
			tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end 
end
