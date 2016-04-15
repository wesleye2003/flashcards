def create
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  @user.save!
end

get '/users/new' do
  erb :'create'
end

post 'users' do
  create
  redirect '/login'
end

get '/logout' do
  sessions.clear
  redirect '/decks'
end

get '/decks' do
  erb :'decks'
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @possible_cards = @deck.cards.select do |card|
    guess = Guess.find_by(card: card, round_id: 3)
    p guess
    p guess.nil? || (guess.correct == false)
  end

  redirect "/" if @possible_cards.empty?

  @card = @possible_cards.sample
  erb :'question'
end

post '/decks/:deck_id' do
  given_guess = params[:guess]
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  # round = Round.find(params[:round_id])
  q = (given_guess == @card.answer)
  puts "the answer is #{q}"

  guess = Guess.find_or_create_by(card: @card, round_id: 3)
  guess.update(correct: q)

  # if q
    redirect "/decks/#{params[:deck_id]}"
  # else
  #   erb :question
  # end

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
