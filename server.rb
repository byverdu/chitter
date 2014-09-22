require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'


class Chitter < Sinatra::Base

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	require './lib/user'

	DataMapper.finalize

	DataMapper.auto_migrate!

	enable :sessions
	set    :session_secret, 'my secret'

	use Rack::Flash
	use Rack::MethodOverride
	
	get '/' do
		erb :index
	end

	get '/user/new' do

		@user = User.new
		erb :"user/new"
	end


	post '/user' do

		@user = User.create(
					 email:     						 params[:email],
		  		 password:  						 params[:password],
		  		 password_confirmation:  params[:password_confirmation],
					 name:      						 params[:name],
		       user_name: 						 params[:user_name]
											)

		if @user.save
			
			session[:user_id] = @user.id

			redirect to '/'

		else
			flash.now[:errors] = @user.errors.full_messages
			erb :"user/new"
		end
	end




	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end
end