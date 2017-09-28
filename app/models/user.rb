class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user.password_hash == password
    nil
  end

end
