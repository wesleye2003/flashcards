# shows current user's profile 
get '/users/:user_id' do
	#redirect home if current user tries to visit another user's profile
  redirect '/' unless params[:user_id] == current_user.id
  erb :"users/profiles/index"
end