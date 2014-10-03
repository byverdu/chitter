class Chiter

	include DataMapper::Resource

	has 1, :user, through: Resource

	property :id,        Serial
	property :content,   Text
	property :at_time,   Time
	property :name,      String
  property :user_name, String

end