class User < ApplicationRecord
  include BCrypt
  has_many :answers

  validates :username, :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return nil if user == nil
    return user if user.password == password
    nil
  end

end
