require "json"
require "rest-client"

# TODO: Write a seed to insert 100 posts in the database fetched from the Hacker News API.

url = "https://hacker-news.firebaseio.com/v0/topstories.json"
table = JSON.parse(RestClient.get url)

table[0..9].each do |i|
  details = "https://hacker-news.firebaseio.com/v0/item/#{i}.json?print=pretty"
  json = JSON.parse(RestClient.get details)
  post = Post.new(name: json['name'], url: json['url'])
  post.save
end