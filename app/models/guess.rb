class Guess < ActiveRecord::Base

  belongs_to :card
  belongs_to :round

  validates :correct, presence: true

end
