class User

	include DataMapper::Resource

	property :id       ,        Serial
	property :email    ,        String, unique: true
	property :password ,        Text
	property :confirm_password, Text
	property :name     ,        String
	property :user_name,        String

	validates_uniqueness_of :email

end