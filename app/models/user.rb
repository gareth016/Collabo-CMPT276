class User < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :trackable, :validatable,
    	:authentication_keys => [:login]
	#validates :password, presence:true
	#validates :username, presence:true 
	#validates :email, presence:true

	validates :username, presence:true, :uniqueness => { case_sensitive:false } 
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

	validate :validate_username

	def validate_username
  		if User.where(email: username).exists?
    		errors.add(:username, :invalid)
  		end
	end


	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end	
	  end
	end

	#has_many :memberships, 	dependent: :destroy
	#has_many :groups, 		through: :memberships
	
	has_many :group_users
	has_many :groups, through: :group_users
end
