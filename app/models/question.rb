class Question < ApplicationRecord
  validates :title, :description, :user, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes
  has_many :comments, as: :commentable

  def points
    votes.sum(:value)
  end
end
