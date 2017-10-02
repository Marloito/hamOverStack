class Question < ApplicationRecord
  validates :title, :description, :user, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
