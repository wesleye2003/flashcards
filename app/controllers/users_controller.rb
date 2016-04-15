get '/users/3/profile' do
  redirect '/login' unless User.find(session[:user_id])
  @user = User.find(params[:user_id])
  # @profile = @user.profile

  erb :"views/users/profile/index"
end



