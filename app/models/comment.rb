class Comment < ActiveRecord::Base
  belongs_to :user
  # belongs_to :question, polymorphic: true
  belongs_to :commentable, polymorphic: true
  validates :comment, presence: true
  has_many :votes, as: :voteable
end
