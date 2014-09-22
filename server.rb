require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'


class Chitter < Sinatra::Base

	env = ENV["RACK_ENV"] || "test"

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	require './lib/user'

	DataMapper.finalize

	DataMapper.auto_migrate!

	get '/' do
		erb :index
	end

	enable :sessions

	use Rack::Flash
	use Rack::MethodOverride
end