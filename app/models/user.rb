require 'bcrypt'

class User < ActiveRecord::Base

  has_many :rounds
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    @user.password == password ? @user : false
  end
end
