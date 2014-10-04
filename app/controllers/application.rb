class App < Sinatra::Base

	get '/' do
	
		@chitters = Chitter.all
		erb :index
	end

end