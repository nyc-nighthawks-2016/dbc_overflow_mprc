class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_secure_password

  validates :username, presence:true, uniqueness: true, length:{minimum: 5, maximum: 20}
  validates :email, presence:true, uniqueness: true
  validates :password, presence: true, length:{minimum: 8}
end
