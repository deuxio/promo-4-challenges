class User < ActiveRecord::Base
  has_many :posts
  validates :username, :email, presence: true
  validates :email, format: { with: /\w+@\w+\.\w{2,3}/, message: "invalid email" }
  validates :username, uniqueness: true
end