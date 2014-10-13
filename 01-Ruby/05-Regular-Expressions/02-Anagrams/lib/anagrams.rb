def anagrams?(a_string, another_string)
  # TODO: implement the obvious method to test if two words are anagrams
  a_string = a_string.gsub(/\W/, "").downcase
  another_string = another_string.gsub(/\W/, "").downcase
  a_string.split(//).sort == another_string.split(//).sort
end

def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
  a_string = a_string.gsub(/\W/, "").downcase
  another_string = another_string.gsub(/\W/, "").downcase

  a_string_hash = Hash.new(0)
  another_string_hash = Hash.new(0)

  a_string.scan(/\w/).each { |a| a_string_hash[a] += 1 }
  another_string.scan(/\w/).each { |key| another_string_hash[key] += 1 }

  a_string_hash == another_string_hash
end