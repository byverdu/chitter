require "bcrypt"

class User

	include DataMapper::Resource

	property :id,          Serial
	property :email,       String,  unique: true
	property :pswd_digest, Text
	property :name,        String
	property :user_name,   String,  unique: true


	attr_reader   :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password
	validates_uniqueness_of   :email, :user_name

	def password=(password)
		@password = password
	 	self.pswd_digest = BCrypt::Password.create(password)
	end 

end