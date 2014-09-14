class User

	include DataMapper::Resource

	property :id,          Serial
	property :email,       String,  unique: true 
	property :pswd_digest, Text 
	property :name,        String
	property :user_name,   String,  unique: true 

end