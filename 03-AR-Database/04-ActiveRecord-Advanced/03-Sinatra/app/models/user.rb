class User < ActiveRecord::Base
  has_many :posts
  # before_validation :stripspaces
  # validates :username, :email, presence: true
  # validates :email, format: { with: /\A\w+@\w+\.\w{2,3}\z/, message: "invalid email" }
  # validates :username, uniqueness: true
end

def stripspaces
  self.email = email.lstrip.rstrip unless email.nil?
end