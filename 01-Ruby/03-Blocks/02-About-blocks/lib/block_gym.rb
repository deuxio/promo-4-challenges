def tag(tag_name, attr = nil)
  # TODO:  Build HTML tags around content given in the block
  #        The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  line = "<" + tag_name
  attr.nil? ? "" : line += " " + attr[0] + "='" + attr[1] + "'"
  line += ">"
  line += yield
  line += "</" + tag_name + ">"
  # puts line
end

def timer_for
  # TODO:  Return time taken to execute the given block
  start_time = Time.now
  yield
  Time.now - start_time
end

# tag("h1", ["id", "title"]) do
#   "Some Title"
# end

# tag("h2") do
#   "Some Title"
# end

# r = tag("div", ["class", "kitt-container"]) do
#   tag("a", ["href", "http://kitt.lewagon.org"]) do
#     tag("h2") do
#       "KITT"
#     end
#   end
# end

# p r