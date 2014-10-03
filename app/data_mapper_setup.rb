require "data_mapper"

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

	require_relative "./models/user"
	require_relative "./models/chiter"

	DataMapper.finalize

	DataMapper.auto_migrate! 