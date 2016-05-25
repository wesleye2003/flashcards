# user login page
get '/login' do
	erb :login
end

# handle submission of user login credentials
post '/login' do
	user = User.authenticate(params[:username], params[:password_text])
	if user
		session[:user_id] = user.id
		redirect "/"
	else
		@errors = ["Password/email combination is incorrect"]
		erb :login
	end
end

# logs out current user 
get '/logout' do
	session.delete(:user_id)
	redirect "/"
end