require 'faker'

wes = User.new(username: 'wes', email: 'wes@wes.com')
wes.password = "password"
wes.save

josh = User.new(username: 'josh', email: 'josh@josh.com')
josh.password = "password"
josh.save

rocky = User.new(username: 'rocky', email: 'rocky@rocky.com')
rocky.password = "password"
rocky.save

erica = User.new(username: 'erica', email: 'erica@erica.com')
erica.password = "password"
erica.save

deck_1 = Deck.create(name: 'Hipster Albums')

deck_2 = Deck.create(name: 'Nonexistent Web Apps 101')

deck_3 = Deck.create(name: 'Book Genres')

deck_4 = Deck.create(name: 'Superhero Powers')

deck_5 = Deck.create(name: 'Star Wars')

5.times do 

	deck_1.cards.create(question: "What is the name of #{Faker::Hipster.words(2).join}'s latest album?", answer: Faker::Hipster.word)

	deck_2.cards.create(question: "Who developed #{Faker::App.name}?", answer: Faker::App.author)

	deck_3.cards.create(question: "What genre does #{Faker::Book.title} belong to?", answer: Faker::Book.genre)

	deck_4.cards.create(question: "What power does #{Faker::Superhero.name} have?", answer: Faker::Superhero.power)

	deck_5.cards.create(question: "True or false: #{Faker::StarWars.character} is a #{Faker::StarWars.specie}", answer: "false")

end