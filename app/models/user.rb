class User < ApplicationRecord
  has_many :comments
  
  has_many :memberships
  has_many :groups, through: :memberships


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# validates :password, presence:true
	# validates :username, presence:true 
	# validates :email, presence:true
end
