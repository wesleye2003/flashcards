get "/decks" do

  @decks = Deck.all

	erb :"decks/index"
end

get '/decks/:id/results' do
 @deck = Deck.find(params[:id])

 # erb:
end

get "/decks/:id" do
  Round.new(deck_id: params[deck_id])
end

