get '/users/:id' do
	#redirect home if current user tries to visit another user's profile
  if current_user.id == params[:id].to_i
    erb :"users/show"
  else
    redirect '/'
  end
end

