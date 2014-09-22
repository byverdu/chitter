require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'


class Chitter < Sinatra::Base

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	require './lib/user'

	DataMapper.finalize

	DataMapper.auto_upgrade!

	enable :sessions
	set :session_secret, 'my secret'

	get '/' do
		erb :index
	end

	post '/user' do

		user = User.create(email:     						 params[:email],
								  		 password:  						 params[:password],
								  		 password_confirmation:  params[:password_confirmation],
											 name:      						 params[:name],
								       user_name: 						 params[:user_name]
											)

		session[:user_id] = user.id

		redirect to '/'
	end

	get '/user/new' do
		erb :"user/new"
	end


	use Rack::Flash
	use Rack::MethodOverride

	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end
end