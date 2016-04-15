# Handle showing of individual flashcards
get "/decks/:deck_id/cards/:id" do
  @cards = shuffled_cards(params[:deck_id])
  erb :"cards/show"
end
