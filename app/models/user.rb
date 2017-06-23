class User < ApplicationRecord
	validates :password, presence:true
	validates :username, presence:true 
	validates :email, presence:true
end
