require "data_mapper"

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, ENV['DATABASE_URL'])

	require_relative "./models/user"
	require_relative "./models/chitter"

	DataMapper.finalize
