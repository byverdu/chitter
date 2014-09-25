require "sinatra/base"
require "data_mapper"
require "rack-flash"


class Chiter < Sinatra::Base

	use Rack::Flash

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")


	DataMapper.finalize

	#DataMapper.upgrade!

	get '/' do 
		erb :index
	end

end