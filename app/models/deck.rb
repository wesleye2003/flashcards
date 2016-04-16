class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :users, through: :rounds
  has_many :cards
  has_many :guesses, through: :cards

  validates :name, presence: true

end
