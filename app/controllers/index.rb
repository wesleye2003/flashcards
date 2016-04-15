def create
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  @user.save!
end

get '/' do
  redirect '/decks'
end

get '/users/new' do
  erb :'create'
end

post '/users' do
  create
  redirect '/login'
end

get '/users/:id' do
  redirect '/login' unless session[:loggedin] = true
  @user = User.find(params[:id])
  @rounds = @user.rounds
  erb :profile
end

get '/logout' do
  sessions.clear
  redirect '/decks'
end

get '/decks' do
  @decks = Deck.all
  erb :'decks'
end

get '/decks/:deck_id' do
  redirect '/login' unless session[:loggedin] = true
  #params to get the deck we
  erb :'selected_deck'
end

get '/login' do
  erb :'login'
end

post '/login' do
  if User.authenticate(params[:username], params[:password])
      session[:loggedin] = true
      # session[:user_name] = User.find_by(email: params[:email]).username
      session[:user_id] = User.find_by(username: params[:username]).id
      redirect '/decks' #need to figure this out path
  else
      @login_error = true
      erb :'/login'
  end
end
