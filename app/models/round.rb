class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many   :cards, through: :guesses
  has_many   :guesses

  validates :user_id, presence: true
  validates :deck_id, presence: true

  def number_right_first_try
    cards = self.cards
    count = cards.count { |card|
      card.guesses.count == 1
    }
    count
  end

  def number_of_guesses
    self.guesses.count
  end
end
