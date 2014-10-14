def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  {
    character_count: text.split(//).length,
    line_count: text.split(/\n/).length,
    word_count: text.scan(/\w+/).length,
    sentence_count: text.split(/\.|\?|!/).length,
    paragraph_count: text.split(/\n\n/).length,
    average_words_per_sentence: text.split(/\.|\?|!/).length == 0 ? 1 : text.scan(/\w+/).length / text.split(/\.|\?|!/).length,
    average_sentences_per_paragraph: text.split(/\n\n/).length == 0 ? 1 : text.split(/\.|\?|!/).length / text.split(/\n\n/).length
  }
end

# analyze("salut machin")