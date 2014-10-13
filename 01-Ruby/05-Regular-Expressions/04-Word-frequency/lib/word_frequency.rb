def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  source_text = []
  stop_words = []

  File.open(file_name, "r").each_line do |line|
    source_text += line.downcase.scan(/\w+/)
  end
  File.open(stop_words_file_name, "r").each_line do |line|
    stop_words += line.downcase.scan(/\w+/)
  end
  words = source_text - stop_words
  count_words = Hash.new(0)

  words.each { |key| count_words[key] += 1 }
  Hash[count_words.sort { |a, b| b[1] <=> a[1] }.first number_of_word]
end