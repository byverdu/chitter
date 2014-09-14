require 'data_mapper'
require 'rack-flash'
require 'sinatra/base'


class Chitter < Sinatra::Base

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	require './lib/user'

	DataMapper.finalize

	DataMapper.auto_upgrade!

	get '/' do
		'Hello world'
	end

	use Rack::Flash
	use Rack::MethodOverride
end