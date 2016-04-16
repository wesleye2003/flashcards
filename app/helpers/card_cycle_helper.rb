# Shuffles a supplied deck's cards
helpers do
	def shuffled_cards(round_id)
	  round = Round.find(round_id)
    deck = round.deck
    cards = deck.cards
    results = []
    cards.each do |card|
      guesses = card.guesses.to_a
      results << card if guesses.all? { |guess| guess.correct != true }
    end
	  results.shuffle!
	end
end


# cards = deck.cards {|card| card.guesses.correct != true}
