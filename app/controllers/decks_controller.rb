get "/decks" do
	erb :"/decks/index"
end

#
get "/decks/:id" do
  Round.new(deck_id: params[deck_id])
end
