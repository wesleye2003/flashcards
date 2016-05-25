# if there is a logged in user, @current_user represents that User instance.
helpers do
	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end
end