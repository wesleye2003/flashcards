# new user creation form
get '/users/new' do
  erb :"users/new"
end

# creates new user from supplied information, or shows errors if user
# cannot be created.
post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  if current_user
    #redirect home if current user tries to visit another user's profile
    if current_user.id == params[:id].to_i
      erb :"users/show"
    else
      redirect '/decks'
    end
  else
    redirect '/decks'
  end
end

