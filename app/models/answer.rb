class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, presence: true
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
