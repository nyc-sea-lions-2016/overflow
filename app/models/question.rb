class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
