require "sinatra/base"
require "data_mapper"
require "rack-flash"


class App < Sinatra::Base

	set :views, Proc.new{ File.join(File.dirname(__FILE__), './app/views') }

	use Rack::Flash
	use Rack::MethodOverride

	enable :sessions

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

	require "./app/lib/user"
	require "./app/lib/chiter"

	DataMapper.finalize

	DataMapper.auto_migrate! 

	get '/' do



		@chiters = Chiter.all

		erb :index
	end
  get '/user/new_user' do
  	erb :"user/new_user"
  end

	post '/user/new_user' do
	@user = User.new

		@user = User.create(email:            params[:email],
                        password:         params[:password],
		                    confirm_password: params[:confirm_password],
		                    name:             params[:name],
		                    user_name:        params[:user_name]
		                   )
		if @user.save
			session[:user_id] = @user.id

			redirect to '/user/profile' 				
		else
			redirect to '/user/new_user'
		end
	end

	get '/user/profile' do

		@user = User.first(id: session[:user_id])

		erb :"user/profile"
	end


end

















