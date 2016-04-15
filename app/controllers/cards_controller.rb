get "/decks/:deck_id/cards/:id" do
  @cards = shuffled_cards(params[:deck_id])
  # @card = card
  erb :"cards/show"

end
