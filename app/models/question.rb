class Question < ApplicationRecord
  validates :title, :description, :user, presence: true

  belongs_to :user
  has_many :answers
end
