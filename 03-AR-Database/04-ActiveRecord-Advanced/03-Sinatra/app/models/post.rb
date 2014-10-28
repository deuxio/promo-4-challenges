class Post < ActiveRecord::Base
  default_scope { order('votes DESC') }
  belongs_to :user
  validates :name, :url, presence: true
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: { with: /\Ahttps?\:\/\/(?:www\.|)?\w+\.\w{2,3}(?:\/\w+)?/, message: "invalid url" }

  def upvote
    self.votes += 1
    save
  end
end