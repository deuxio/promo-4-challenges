require 'nokogiri'
require 'open-uri'
require_relative 'view'

class Import
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
  end

  def from_marmiton(ingredient)
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
    doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      recipe_name = element.search('.m_titre_resultat > a').inner_text
      recipe_link = "http://www.marmiton.org" + element.search('.m_titre_resultat > a').attribute("href")
      recipe_description = element.search('.m_texte_resultat').inner_text
      recipe_rating = element.search('.m_recette_note1').size
      recipe_votes = element.search('.m_recette_nb_votes').inner_text.scan(/\d+/)[0].to_i
      recipe_prep_time = element.css('.m_detail_time > div:first-child').inner_text.gsub("min","")
      recipe_cook_time = element.css('.m_detail_time > div:nth-child(2)').inner_text.gsub("min","")
      recipe = Recipe.new(recipe_name, recipe_description, recipe_prep_time, recipe_cook_time, recipe_link, recipe_rating, recipe_votes)
      @cookbook.add_recipe(recipe)
    end
  end

  def import_recipe_details_from_marmiton
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
  end
end