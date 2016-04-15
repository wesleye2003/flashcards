class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :round, presence: true
  validates :card, presence: true
end
