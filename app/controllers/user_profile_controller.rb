
# <<<<<<< HEAD
get '/users/3/profile' do
  redirect '/login' unless User.find(session[:user_id])
  @user = User.find(params[:user_id])
  # @profile = @user.profile

  erb :"views/users/profile/index"
end



# =======
# get '/users/new' do
#   erb :"users/new"
# end

# post '/users' do
#   user = User.new(params[:user])
#   if user.save
#     session[:user_id] = user.id
#     redirect "/"
#   else
#     @errors = user.errors.full_messages
#     erb :"users/new"
#   end
# end
# >>>>>>> f2f95231c86c942c4f8a6fcb0f6880ed89d7fba0
