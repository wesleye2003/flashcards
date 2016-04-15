require 'faker'

wes = User.new(username: 'wes', email: 'wes@wes.com')
wes.password = "password"
wes.save

deck_1 = Deck.create(name: 'random_deck_1')

deck_2 = Deck.create(name: 'random_deck_2')

deck_3 = Deck.create(name: 'random_deck_3')

deck_4 = Deck.create(name: 'random_deck_4')

deck_5 = Deck.create(name: 'random_deck_5')

5.times do 

	deck_1.cards.create(question: Faker::Name.name, answer: "yes")

	deck_2.cards.create(question: Faker::Name.name, answer: "yes")

	deck_3.cards.create(question: Faker::Name.name, answer: "yes")

	deck_4.cards.create(question: Faker::Name.name, answer: "yes")

	deck_5.cards.create(question: Faker::Name.name, answer: "yes")

end