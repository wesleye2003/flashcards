def shuffled_cards(deck_id)
  deck = Deck.find(deck_id)
  cards = deck.cards
  cards.shuffle!
end
