class PostView
  def all_posts(posts)
    posts.each do |post|
      puts "#{post.id} - #{post.name.capitalize} (#{post.url})"
      puts "Votes: #{post.votes || 0}"
    end
  end

  def display(text)
    puts "*** #{text.upcase} ***"
  end

  def post_name
    puts "Post name?"
    gets.chomp
  end

  def post_url
    puts "Post url?"
    gets.chomp
  end

  def post_id
    puts "id?"
    gets.chomp.to_i
  end
end