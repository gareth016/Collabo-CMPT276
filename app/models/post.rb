class Post < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :title, presence: true, length:{maximum:100}
	validates :post, presence: true

end
