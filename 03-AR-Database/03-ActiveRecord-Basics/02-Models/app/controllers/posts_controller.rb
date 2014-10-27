require_relative "../views/post_view.rb"

class PostsController
  def initialize
    @view = PostView.new
  end

  def index
    posts = Post.all
    @view.all_posts(posts)
  end

  def create
    @view.display("create")
    name = @view.post_name
    url = @view.post_url
    post = Post.new(name: name, url: url)
    post.save
  end

  def update
    @view.display("update")
    index
    post = Post.find(@view.post_id)
    post.name = @view.post_name
    post.url = @view.post_url
    post.save
  end

  def destroy
    @view.display("destroy")
    index
    post = Post.find(@view.post_id)
    post.destroy
  end

  def upvote
    @view.display("upvote")
    index
    post = Post.find(@view.post_id)
    post.votes.nil? ? post.votes = 1 : post.votes += 1
    post.save
  end
end