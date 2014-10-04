class App < Sinatra::Base

	get '/' do

		if session[:user_id]

			redirect '/user/profile'

		else
	    @chitters = Chitter.all
			erb :index
		end
	end

end