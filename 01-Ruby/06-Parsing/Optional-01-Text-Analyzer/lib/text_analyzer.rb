def analyze(t)
  # TODO: should analyze the t, and return the result hash with all features
  {
    character_count: t.split(//).count,
    line_count: t.split(/\n/).count,
    word_count: t.scan(/\w+/).count,
    sentence_count: t.split(/\.|\?|!/).count,
    paragraph_count: t.split(/\n\n/).count,
    average_words_per_sentence: t.split(/\.|\?|!/).count == 0 ? 1 : t.scan(/\w+/).count / t.split(/\.|\?|!/).count,
    average_sentences_per_paragraph: t.split(/\n\n/).count == 0 ? 1 : t.split(/\.|\?|!/).count / t.split(/\n\n/).count
  }
end

# analyze("salut machin")