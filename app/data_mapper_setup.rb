require "data_mapper"

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

	require_relative "./models/user"
	require_relative "./models/chitter"

	DataMapper.finalize
