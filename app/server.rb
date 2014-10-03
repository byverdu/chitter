require "sinatra/base"
require "data_mapper"
require "rack-flash"

require_relative 'data_mapper_setup'


class App < Sinatra::Base

	set :views, Proc.new{ File.join(File.dirname(__FILE__), 'views') }

	use Rack::Flash
	use Rack::MethodOverride

	enable :sessions
	set    :session_secret, 'my secret'




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
		@chiters = Chiter.all

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

	end

	post '/user/profile' do

		if params[:content]

			Chiter.create(content:params[:content],at_time:Time.now)

			redirect '/user/profile'

		else
			session[:user_id] = nil
			redirect '/'
		end
	end

helpers do

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end
end


end

















