class User

	include DataMapper::Resource

	property :id       ,        Serial
	property :email    ,        String, unique: true, message: 'Email is already taken'
	property :password ,        Text
	property :confirm_password, Text
	property :name     ,        String
	property :user_name,        String, unique: true

	validates_uniqueness_of :email, :user_name

end