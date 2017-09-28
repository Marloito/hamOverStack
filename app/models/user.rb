class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end
