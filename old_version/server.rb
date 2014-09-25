require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'


class Chitter < Sinatra::Base

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	require './lib/user'
	require './lib/chitt'

	DataMapper.finalize

	DataMapper.auto_migrate!

	enable :sessions
	set    :session_secret, 'my secret'

	use Rack::Flash
	use Rack::MethodOverride
	
	get '/' do
		@chitts = Chitt.all
		erb :index
	end

	get '/users/new' do

		@user = User.new
		erb :"users/new"
	end


	post '/users/new' do

		@user = User.create(
					 email:     						 params[:email],
		  		 password:  						 params[:password],
		  		 password_confirmation:  params[:password_confirmation],
					 name:      						 params[:name],
		       user_name: 						 params[:user_name]
											)

		if @user.save
			
			session[:user_id] = @user.id

			redirect to('/')

		else
			flash.now[:errors] = @user.errors.full_messages
			erb :"users/new"
		end
	end

	get '/sessions/new' do
	  erb :"sessions/new"
	end

	post '/sessions' do
    user_name, password = params[:user_name], params[:password]

    user = User.authenicate(user_name, password)

    if user
      
      session[:user_id] = user.id
      redirect to('/')

    else
    	flash[:errors] = ["The user name or password is incorrect"]
      erb :"sessions/new"	
    end
	end

	delete '/sessions' do
		flash[:notice] = "Good bye!"
		session[:user_id] = nil
		redirect to '/'
	end


	# post '/chitts' do

	# 	@user = User.first(id: session[:user_id])

	# 	puts session[:user_id]

	# 	content = params[:content]

	# 	Chitt.create(user: @user.user_name, content: content)

	# 	redirect to '/'
	# end


	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end
end