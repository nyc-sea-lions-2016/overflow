class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments

  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true
end
