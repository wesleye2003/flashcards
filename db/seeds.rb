Deck.find_or_create_by(name: "Mammals")
Deck.find_or_create_by(name: "Bro Facts")
Deck.find_or_create_by(name: "Bird Facts")

Round.find_or_create_by(correct_first_try: 6, total_attempts: 20, user_id: 1, deck_id: 1)
Round.find_or_create_by(correct_first_try: 3, total_attempts: 22, user_id: 1, deck_id: 2)
Round.find_or_create_by(correct_first_try: 9, total_attempts: 17, user_id: 1, deck_id: 2)
Round.find_or_create_by(correct_first_try: 2, total_attempts: 18, user_id: 1, deck_id: 3)

Card.find_or_create_by(question:"How old is Liz?", answer:"27", deck_id: 1)
Card.find_or_create_by(question:"When did Liz graduate?", answer:"2011", deck_id: 1)
Card.find_or_create_by(question:"What does Liz like to do?", answer:"Chill", deck_id: 1)
Card.find_or_create_by(question:"What pizza does Liz enjoy most?", answer:"Hawaiian", deck_id: 1)
Card.find_or_create_by(question:"Where was Liz born?", answer:"Bridgeport", deck_id: 1)

dog_deck = Deck.create(name: "Dogs")
cat_deck = Deck.create(name: "Cats")

Card.create(question: "Who's a good boy?", answer: "Me", deck: dog_deck)
Card.create(question: "What's the best day ever?", answer: "Today!", deck: dog_deck)

Card.create(question: "What is your favorite activity?", answer: "napping", deck: cat_deck)
Card.create(question: "How many legs do you have?", answer: "Fuck off!", deck: cat_deck)

User.create(username: "Greg", password: "Greg")
User.create(username: "Dave", password: "Dave")

