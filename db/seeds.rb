dog_deck = Deck.create(name: "Dogs")
cat_deck = Deck.create(name: "Cats")

Card.create(question: "Who's a good boy?", answer: "Me", deck: dog_deck)
Card.create(question: "What's the best day ever?", answer: "Today!", deck: dog_deck)

Card.create(question: "What is your favorite activity?", answer: "napping", deck: cat_deck)
Card.create(question: "How many legs do you have?", answer: "Fuck off!", deck: cat_deck)

User.create(username: "Greg", password: "Greg")
User.create(username: "Dave", password: "Dave")
