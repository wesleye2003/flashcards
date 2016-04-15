class Card < ActiveRecord::Base

  belongs_to :deck

  validates :question, presence: true
  validates :answer, presence: true
  validates :deck, presence: true

end
