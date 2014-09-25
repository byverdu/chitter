require "sinatra/base"

class Chiter < Sinatra::Base

	get '/' do 
		erb :index
	end

end