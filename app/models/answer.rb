class Answer < ApplicationRecord
  validates :description, :user, :question, presence: true
  belongs_to :user
  belongs_to :question
  has_many :votes
  has_many :comments, as: :commentable
  # validate :not_own_question
  validates :question, uniqueness: {scope: :user, message: "- You've already answered this question"}

  # def not_own_question
  #   p self.question.user
  #   p '*' * 100
  #   p self.user
  #   if self.question.user == self.user
  #     errors.add(:question, "- Cannot answer own question")
  #   end
  # end

  def points
    votes.sum(:value)
  end
end
