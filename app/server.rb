require "data_mapper"
require "rack-flash"
require "sinatra/base"
require "sinatra/partial"

require_relative 'data_mapper_setup'
require_relative 'helpers'

require_relative './controllers/application'
require_relative './controllers/user'
require_relative './controllers/session'


class App < Sinatra::Base

	include Helpers

	set :views,         Proc.new{ File.join(File.dirname(__FILE__), 'views') }
	set :public_folder, Proc.new{ File.join(File.dirname(__FILE__), 'public') }

	configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end
  
	use Rack::Flash
	use Rack::MethodOverride

	enable :sessions
	set    :session_secret, 'my secret'


end

















