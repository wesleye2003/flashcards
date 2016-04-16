class Guess < ActiveRecord::Base
  # belongs to rounds table
  belongs_to :round
  # belongs to cards table
  belongs_to :card

  # Removed :through association. belongs_to can only have :through on a join table.
  belongs_to :user


  validates :round, presence: true
  validates :card, presence: true
end
