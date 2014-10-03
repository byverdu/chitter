require "sinatra/base"
require "data_mapper"
require "rack-flash"

require_relative 'data_mapper_setup'

require_relative './controllers/application'
require_relative './controllers/user'
require_relative './controllers/session'


class App < Sinatra::Base

	set :views, Proc.new{ File.join(File.dirname(__FILE__), 'views') }

	use Rack::Flash
	use Rack::MethodOverride

	enable :sessions
	set    :session_secret, 'my secret'






helpers do

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end
end


end

















