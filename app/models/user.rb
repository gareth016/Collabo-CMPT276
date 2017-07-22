class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :trackable, :validatable
	#validates :password, presence:true
	#validates :username, presence:true 
	#validates :email, presence:true

	has_many :memberships, 	dependent: :destroy
	has_many :groups, 		through: :memberships\
end
