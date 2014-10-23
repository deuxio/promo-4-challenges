require 'nokogiri'
require 'open-uri'
  # response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=lapin")

response = open("http://www.marmiton.org/part/recette-pas-chere/recette_sorbet-fraise_1505.aspx")
p response
doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
p doc

doc.search('.m_content_recette_main').each do |element|
  puts element
  recipe_description = doc.search('.preparation').inner_text
  puts "Description: #{recipe_description}"
end


# def import_recipe_details_from_marmiton(url)
#   response = open(url)
# end