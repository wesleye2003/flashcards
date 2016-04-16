get "/decks/:id/rounds/new" do
  deck = Deck.find(params[:id])
  round = deck.rounds.new
  round.save
  redirect "/decks/#{deck.id}/rounds/#{round.id}"
end

get "/decks/:deck_id/rounds/:id" do
  @round = Round.find(params[:id])
  @deck = @round.deck
  cards = shuffled_cards(@round.id)
  unless cards.empty?
    @card = cards.pop
    erb :"cards/show"
  else
    @round.destroy unless current_user
    erb :"rounds/results"
  end
end

post "/rounds/:round_id/cards/:id" do
  @round = Round.find(params[:round_id])
  @deck = @round.deck
  @card = Card.find(params[:id])
  guess = @card.guesses.new(round_id: @round.id, response: params[:guess])
  if guess.response == @card.answer
    guess.correct = true
  else
    guess.correct = false
  end
  guess.save
  redirect "/decks/#{@deck.id}/rounds/#{@round.id}"
end
