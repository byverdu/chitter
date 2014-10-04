class App < Sinatra::Base

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
		@chitters = Chitter.all

		erb :"user/profile"
	end

	post '/user/profile' do

		if params[:content]

			user = User.first(id: session[:user_id])

			Chitter.create(content:params[:content],at_time: time_at(Time.now),
				            name:user.name, user_name: user.user_name)


			redirect '/user/profile'

		else
			session[:user_id] = nil
			redirect '/'
		end
	end

	def time_at(time)
		time.strftime("%d/%b/%Y at %H:%M")
	end


end