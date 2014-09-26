require "sinatra/base"
require "data_mapper"
require "rack-flash"


class App < Sinatra::Base

	set :public_folder, Proc.new{ File.join(File.dirname(__FILE__), 'views') }

	use Rack::Flash

	enable :sessions

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")


	DataMapper.finalize

	#DataMapper.upgrade!

	get '/' do 
		erb :index
	end

end