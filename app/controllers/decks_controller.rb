# Display all decks
get "/decks" do
  @decks = Deck.all
	erb :"decks/index"
end

get "/decks/:id" do
  redirect "/decks/#{params[:id]}/rounds/new"
end
