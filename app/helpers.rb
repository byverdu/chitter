module Helpers

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

def format_time(time)
	time.strftime("%d/%b/%Y at %H:%M")
end
	
end