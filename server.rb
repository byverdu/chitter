require "sinatra/base"
require "data_mapper"
require "rack-flash"


class App < Sinatra::Base

	set :views, Proc.new{ File.join(File.dirname(__FILE__), './app/views') }

	use Rack::Flash
	use Rack::MethodOverride

	enable :sessions
	set    :session_secret, 'my secret'

	env = ENV["RACK_ENV"] || "development"

	DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

	require "./app/lib/user"
	require "./app/lib/chiter"

	DataMapper.finalize

	DataMapper.auto_migrate! 

	########################################


	get '/' do
	
		@chiters = Chiter.all
		erb :index
	end

  get '/user/new_user' do
		@user = User.new
  	erb :"user/new_user"
  end


	post '/user/new_user' do

		@user = User.create(email:                 params[:email],
                        password:              params[:password],
		                    password_confirmation: params[:password_confirmation],
		                    name:                  params[:name],
		                    user_name:             params[:user_name]
		                   )
		if @user.save
			session[:user_id] = @user.id

			redirect to '/user/profile' 				
		else
			flash[:errors] = @user.errors.full_messages
			redirect to '/user/new_user'
		end
	end

	get '/user/profile' do

		@user = User.first(id: session[:user_id])

		erb :"user/profile"
	end

	get '/session/new_session' do
	
		erb :"session/new_session"
	end


	post '/session/new_session' do

		user_name, password = params[:user_name], params[:password] 

    user = User.authenticate(user_name, password)

    if user
      
      session[:user_id] = user.id
      redirect  '/user/profile'
    else
    	flash[:notice] = ['That user name do not exist','Wrong password']
    	erb :"session/new_session"
    end

	#	if user
      
     # @user = User.first(id: session[:user_id])
      #erb :"user/profile"
			#else
    	#	 redirect to	"/session/new"		#	flash[:errors] = ["The user name or password is incorrect"]  
#   	end

	end

	post '/user/profile' do
		session[:user_id] = nil

		redirect '/'
	end

helpers do

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end
end


end

















