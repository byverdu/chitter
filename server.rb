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
	require "./app/lib/chiter"

	DataMapper.finalize

	DataMapper.auto_upgrade! 

	get '/' do

		@chiters = Chiter.all

		erb :index
	end

	post '/new_user' do
		@user = User.create(email: params[:email],
                        password: params[:password],
		                    confirm_password: params[:confirm_password],
		                    name: params[:name],
		                    user_name: params[:user_name]
		                   )
	end

  get '/new_user' do

  	erb :"user/new_user"
  end

end