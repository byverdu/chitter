class Chitt

	include DataMapper::Resource

	has 1, :user, through: Resource

	property :id,      Serial
	property :content, String
	property :time,    Time


end