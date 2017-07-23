class Post < ApplicationRecord
	belongs_to :group

	has_many :comments, 	dependent: :destroy

	has_many :taggings
	has_many :tags, 		through: :taggings 


	validates :title, presence: true, length:{maximum:100}
	validates :post, presence: true

	def self.tagged_with(name)
		Tag.find_by_name!(name).posts
	end

	def all_tags=(names)
		self.tags = names.split(",").map do |name|
			tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end 

end
