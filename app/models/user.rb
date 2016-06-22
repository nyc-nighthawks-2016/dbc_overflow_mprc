class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_secure_password

  validates :username, presence:true, uniqueness: true, length:{minimum: 5, maximum: 20}
  validates :email, presence:true, uniqueness: true
  validates :password, presence: true, length:{minimum: 8}
end
