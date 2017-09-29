class Answer < ApplicationRecord
  validates :description, :user, :question, presence: true
  belongs_to :user
  belongs_to :question
end
