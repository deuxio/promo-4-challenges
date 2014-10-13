STRINGS = {
  home: {
    intro: {
      en: 'Welcome on Le Wagon',
      fr: 'Bienvenue sur Le Wagon'
    },
    content: {
      explanation: {
        en: 'This is an interesting exercise',
        fr: 'C\'est un exercice interessant',
        de: 'Es ist eine interesante Ãbung'
      },
      goodbye: {
        en: 'Goodbye',
        fr: 'Au revoir',
        es: 'Adios'
      }
    }
  }
}

def translation(a_string, a_language = "en")
  # TODO: your code goes here
  path = a_string.split(".")
  translated_text = Hash.new

  for i in 0..path.length - 1
    if i == 0
      STRINGS[path[i].to_sym].nil? ? translated_text : translated_text = STRINGS[path[i].to_sym]
    else
      translated_text[path[i].to_sym].nil? ? translated_text : translated_text = translated_text[path[i].to_sym]
    end
  end

  if translated_text[a_language.to_sym].nil?
    translated_text[:en].nil? ? "" : translated_text[:en]
  else
    translated_text[a_language.to_sym]
  end
end

# p translation('home.intro', 'fr') # => 'Bienvenue sur Le Wagon'
# p translation('home.intro', 'es') # => 'Welcome on Le Wagon'
# p translation('home.content.goodbye') # => 'Goodbye'
# p translation('unvalid.path','en') # => ''