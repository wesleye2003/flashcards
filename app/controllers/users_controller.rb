# new user creation form
get '/users/new' do
  erb :"users/new"
end

get '/users/:id' do
  # redirect home if current user tries to visit another user's profile
  # redirect '/' unless params[:user_id] == current_user.id
  erb :"users/profiles/index"
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
