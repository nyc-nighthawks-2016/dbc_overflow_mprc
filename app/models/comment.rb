class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  # has_many :votes, as: :voteable, dependent: :destroy

  validates :comment, presence: true
  validates :user, presence: true
end
