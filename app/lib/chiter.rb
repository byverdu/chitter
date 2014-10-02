class Chiter

	include DataMapper::Resource

	property :id,      Serial
	property :content, Text
	property :at_time, Time


end