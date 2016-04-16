get "/decks/:id/rounds/new" do
  deck = Deck.find(params[:id])
  round = deck.rounds.new
  round.save
  redirect "/decks/#{deck.id}/rounds/#{round.id}"
end

get "/decks/:deck_id/rounds/:id" do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:id])
  cards = shuffled_cards(@deck.id)
  unless cards.empty?
    @card = cards.pop
    erb :"cards/show"
  end
  @round.destroy unless current_user
  erb :"rounds/results"
end

post "/decks/:deck_id/cards/:card_id/rounds/:id" do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:id])
  @card = Card.find(params[:card_id])
  guess = @card.guesses.new(response: params[:guess])
  current_user.guesses << guess if current_user
  if guess.response == @card.answer
    guess.correct = true
  else
    guess.correct = false
  end
  redirect "/decks/#{@deck.id}/rounds/#{@round.id}"
end
