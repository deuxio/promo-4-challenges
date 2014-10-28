require 'sinatra'
require "sinatra/reloader" if development?
require_relative "config/application.rb"

# Set public directory
set :public_folder, File.dirname(__FILE__) + '/public'
set :views, proc { File.join(root, "app/views") }

get '/' do
  @posts = Post.all
  erb :posts  # The rendered HTML is in app/views/posts.erb
end

post '/' do
  post = Post.new(name: params[:name], url: params[:url])
  post.save
  redirect to('/')
end

get '/vote_up' do
  post = Post.find(params[:id])
  post.upvote
  redirect to('/')
end