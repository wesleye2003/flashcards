get '/users/:user_id' do
  redirect '/' unless current_user
  # @user = current_user
  # @profile = @user.profile

  erb :"views/users/profile/index"
end






