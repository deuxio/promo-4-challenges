# encoding: UTF-8
require 'nokogiri'
require 'open-uri'
require_relative "recipe"

class Marmiton

  def initialize(cookbook)
    @cookbook = cookbook
  end

  def self.import(ingredient)
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
    doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      recipe_name = element.search('.m_titre_resultat > a').inner_text
      recipe_description = element.search('.m_texte_resultat').inner_text
      recipe_rating = element.search('.m_recette_note1').size
      recipe_votes = element.search('.m_recette_nb_votes').inner_text.scan(/\d+/)[0].to_i
      recipe_prep_time = element.css('.m_detail_time div:first-child').inner_text.gsub("min","")
      recipe_cooking_time = element.css('.m_detail_time div:nth-child(2)').inner_text.gsub("min","")
      recipe = Recipe.new(recipe_name, recipe_description, recipe_tags, recipe_prep_time, recipe_cook_time, recipe_rating, recipe_votes)
      @cookbook.add_recipe(recipe)
    end
  end
end