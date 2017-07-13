class Post < ApplicationRecord
	belongs_to :group

	has_many :comments

	has_many :taggings
	has_many :tags, 		through: :taggings 


	validates :title, presence: true, length:{maximum:100}
	validates :post, presence: true

end
