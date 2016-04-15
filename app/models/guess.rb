class Guess < ActiveRecord::Base
  # belongs to rounds table
  belongs_to :round
  # belongs to cards table
  belongs_to :card
  belongs_to :user, through: :round

  validates :round, presence: true
  validates :card, presence: true
end
