class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user, presence: true
  validates_uniqueness_of :user, :scope => [:votable_id, :votable_type]
end
