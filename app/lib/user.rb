class User

	include DataMapper::Resource

	property :id       ,        Serial
	property :email    ,        String
	property :password ,        Text
	property :confirm_password, Text
	property :name     ,        String
	property :user_name,        String



end