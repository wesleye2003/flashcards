# Shuffles a supplied deck's cards
helpers do
	def shuffled_cards(round_id)
	  round = Round.find(round_id)
    cards = round.cards
    results = []
    cards.each do |card|
      guesses = card.guesses.where(round_id: round.id)
      results << card if guesses.all? { |guess| guess.correct != true}
    end
	  results.shuffle!
	end
end


# cards = deck.cards {|card| card.guesses.correct != true}
