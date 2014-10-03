class App < Sinatra::Base

	get '/' do
	
		@chiters = Chiter.all
		erb :index
	end

end