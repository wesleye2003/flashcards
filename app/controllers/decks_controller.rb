# Display all decks
get "/decks" do
  @decks = Deck.all

	erb :"decks/index"
end

# Display results after round complete
get '/decks/:id/results' do
 @deck = Deck.find(params[:id])

 erb  :'decks/results'
end

get "/decks/:id" do
  @round = Round.new(deck_id: params[:id])
end

