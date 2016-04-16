# Shuffles a supplied deck's cards
helpers do
	def shuffled_cards(deck_id)
	  deck = Deck.find(deck_id)
	  cards = deck.cards.to_a
    # cards {|card| card.guesses.correct == false}
	  cards.shuffle!
	end
end
