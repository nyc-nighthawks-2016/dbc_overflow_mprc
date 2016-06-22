class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user, presence:true
  validates :voteable_id, :voteable_type, presence:true
end
