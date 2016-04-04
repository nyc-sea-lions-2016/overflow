class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user, presence: true
  validates :value, presence: true
  validates_uniqueness_of :user, :scope => [:votable_id, :votable_type]

  def upvote
    self.value < 1 ? self.value += 1 : self.value
  end

  def downvote
    self.value > -1 ? self.value -= 1 : self.value
  end

end
