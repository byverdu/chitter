class App < Sinatra::Base

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
    	flash[:notice] = ["There is a problem with your email or password"]
    	erb :"session/new_session"
    end
	end
end