get '/login' do
	erb :login
end

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

get '/logout' do
	session.delete(:user_id)
	redirect "/"
end