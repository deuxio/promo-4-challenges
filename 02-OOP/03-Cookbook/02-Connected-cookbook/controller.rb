require 'nokogiri'
require 'open-uri'
require_relative 'view'

class Controller
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.recipes
    @view.print_recipes(recipes)
  end

  def create
    recipe_name = @view.ask_recipe_name_to_create
    recipe_description = @view.ask_recipe_description_to_create
    recipe_prep_time = @view.ask_recipe_prep_time_to_create
    recipe_cook_time = @view.ask_recipe_cook_time_to_create
    recipe = Recipe.new(recipe_name, recipe_description, recipe_prep_time, recipe_cook_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.print_recipes(@cookbook.recipes)
    recipe = @view.ask_what_to_detete
    @cookbook.remove_recipe(recipe) if recipe
  end

  def import
    ingredient = @view.ask_ingredient_to_import
    puts "Importing recipe data from marmiton for '#{ingredient}'..."
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
    doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      recipe_name = element.search('.m_titre_resultat > a').inner_text
      recipe_description = element.search('.m_texte_resultat').inner_text
      recipe_rating = element.search('.m_recette_note1').size
      recipe_votes = element.search('.m_recette_nb_votes').inner_text.scan(/\d+/)[0].to_i
      recipe_prep_time = element.css('.m_detail_time > div:first-child').inner_text.gsub("min","")
      recipe_cook_time = element.css('.m_detail_time > div:nth-child(2)').inner_text.gsub("min","")
      recipe = Recipe.new(recipe_name, recipe_description, recipe_prep_time, recipe_cook_time, recipe_rating, recipe_votes)
      @cookbook.add_recipe(recipe)
    end
  end
end