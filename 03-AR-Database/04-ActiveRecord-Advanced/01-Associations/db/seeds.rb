require "json"
require "rest-client"
require "faker"

# Create 5 fake users
5.times do
  user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
  user.save
end


# generate 5 to 10 fake articles per user
5.times do |i|
  (5..10).to_a.sample.times do
    post = Post.new(name: Faker::Lorem.sentence, url: Faker::Internet.url)
    User.find(i + 1).posts << post
    post.save
  end
end