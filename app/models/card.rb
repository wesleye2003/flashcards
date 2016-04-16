class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :rounds, through: :guesses
  has_many :guesses

  validates :question, :answer, :deck_id, null: false

end
