class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many   :cards, through: :deck
  has_many   :guesses

  validates :deck_id, presence: true

  def number_right_first_try
    cards = self.cards

    first_try_cards = cards.select { |card|
      card.guesses.count == 1
    }
    first_try_cards.count
  end

  # def number_of_guesses
  #   self.guesses.count
  # end
end

