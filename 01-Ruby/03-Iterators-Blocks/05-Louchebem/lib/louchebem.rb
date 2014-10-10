# Encoding: utf-8

def louchebemize_word(word, sc_e = nil)
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  vowel = ["a", "e", "i", "o", "u", "y"]
  sc = [",", "!", ".", ";"]

  if word.length <= 1
    word
  elsif sc.include? word[word.length - 1]
    sc_e.nil? ? sc_e = word[word.length - 1] : sc_e += word[word.length - 1]
    word[word.length - 1] = ''
    return louchebemize_word(word, sc_e)
  elsif vowel.include? word[0]
    word[0] = 'l' + word[0]
    word += suffix.sample
  else
    word[word.length] = word[0]
    word[0] = ''
    return louchebemize_word(word, sc_e)
  end
  sc_e.nil? ? word : word + sc_e
end

def louchebemize(sentence)
  words = sentence.split(" ")

  words.map! do |word|
    louchebemize_word(word)
  end
  words.join(' ')
end