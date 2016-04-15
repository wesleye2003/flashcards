class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :round, through: :deck
  has_many :guesses

  validates :question, :answer, :deck_id, null: false

end
