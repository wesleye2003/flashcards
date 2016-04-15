get '/users/:user_id/profile' do
  redirect '/login' unless current_user
  # @user = current_user
  # @profile = @user.profile

  erb :"views/users/profile/index"
end






