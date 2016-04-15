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

  @deck = Deck.find(params[:deck_id])
  @possible_cards = @deck.cards.select do |card|
    guess = Guess.find_by(card: card, round_id: session[:round])
    guess.nil? || (guess.correct == false)
  end

  round_id = session[:round]
  user_id = Round.find(round_id).user.id
  # user_id = 1 # temp
  redirect "/users/#{user_id}" if @possible_cards.empty?

  @card = @possible_cards.sample
  erb :'question'
end

post '/decks/:deck_id' do
  Round.find(session[:round]).total_attempts += 1

  given_guess = params[:guess]
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  # round = Round.find(params[:round_id])
  q = (given_guess == @card.answer)

  guess = Guess.find_or_create_by(card: @card, round_id: session[:round])
  guess.update(correct: q)

  redirect "/decks/#{@deck.id}/response/#{q}"
  # if q
    # # redirect "/decks/#{params[:deck_id]}"
  # else
  #   erb :question
  # end
end

get '/decks/:deck_id/response/:q' do
  if params[:q] == "true"
    @quality = "correct"
  else
    @quality = "wrong"
  end
  @deck_id = params[:deck_id]
  erb :'response'
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
