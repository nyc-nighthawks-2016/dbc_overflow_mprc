class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :answer, presence: true
  validates :question, presence: true
  validates :user_id, presence: true
end
