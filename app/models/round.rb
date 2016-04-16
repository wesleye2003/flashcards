class Round < ActiveRecord::Base

  belongs_to :deck
  belongs_to :user

  validates :correct_first_try, presence: true
  validates :total_attempts, presence: true
  validates :user, presence: true
  validates :deck, presence: true

end
