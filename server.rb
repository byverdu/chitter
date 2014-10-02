require "sinatra/base"
require "data_mapper"
require "rack-flash"


class App < Sinatra::Base

	set :views, Proc.new{ File.join(File.dirname(__FILE__), './app/views') }

	use Rack::Flash

	enable :sessions

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

	require "./app/lib/user"

	DataMapper.finalize

	DataMapper.auto_migrate! 

	get '/' do 
		erb :index
	end

end