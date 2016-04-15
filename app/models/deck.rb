class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :users, through: :rounds
  has_many :cards

  validates :name, presence: true

  def number_of_cards
    cards = Cards.all
    count = cards.count
  end
end
