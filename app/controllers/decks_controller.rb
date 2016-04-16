# Display all decks
get "/decks" do
  @decks = Deck.all

	erb :"decks/index"
end


