require 'bcrypt'

class User < ActiveRecord::Base
  MIN_PASSWORD_LENGTH = 6

  has_many :rounds
  has_many :decks, through: :rounds
  has_many :guesses, through: :rounds

  validates :email, :username, presence: true, uniqueness: true
  validate :password_requirements

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
  	@raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = self.find_by(username: username)
    if user && user.password == password 
    	return user
    else
    	return nil
    end
  end

  def password_requirements
  	unless @raw_password && @raw_password.length >= User::MIN_PASSWORD_LENGTH
      errors.add(:password, "must be 6 characters long") 
    end
  end
end
