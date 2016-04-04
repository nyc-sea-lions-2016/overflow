class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :body, presence: true
  validates :user, presence: true
  validates :question, presence: true

   def vote_count
  	self.votes.map { |vote| vote.value }.reduce(:+) || 0
  end
end
